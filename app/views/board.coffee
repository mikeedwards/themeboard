View = require '../lib/view'
PinView = require './pin'
BoardModel = require '../models/board'
PinModel = require '../models/pin'
PinsCollection = require '../collections/pins'

module.exports = class BoardView extends View
    className: "board layout-container"
    template: require 'views/templates/board'

    model: new BoardModel()
    collection: new PinsCollection()

    events:
        "click .add-pin"    : "onClickAddPin"
        "submit form"       : "onSubmitForm"
        "blur h1"           : "onBlurTitle"
        "keydown h1"        : "onKeydownTitle"

    subscriptions:
        "pin:selected"  : "onPinSelected"
        "pin:destroyed"  : "onPinDestroyed"

    ###
    View methods
    ###
    debug: ->
        @

    initialize: ->
        ThemeBoard?.Collections?.PinsCollection = @collection

        @form = new Backbone.Form
            model:  new PinModel()

        @collection.on "add", @addPin
        @collection.on "remove", @removePin

        @model.bind 'change:title', (model, name) =>
            @render()
            # @$el.find('h1').text @model.get "title"

        super()

    afterRender: ->
        @$pins = @$el.children ".pins"
        @$title = @$el.children "h1"
        @$control = @$el.find ".control"
        @$pinForm = @$el.find ".pin-form"

        @$pins.isotope
            itemSelector:   '.pin'
            layoutMode:     'masonry'

        @collection.each (model) =>
            @addPin model

    ###
    View callbacks
    ###

    onClickAddPin: (ev) ->
        @collection.add new PinModel()

    onPinSelected: (pin) ->
        @highlightPin pin
        @createForm pin

        @$control.show()

        top = pin.$el.position().top \
            + pin.$el.height() \
            + @$pins.position().top \
            + 20
        left = pin.$el.position().left + 20

        @$control.animate
            'left'  : left
            'top'   : top,
            100

    onPinDestroyed: (pin) ->
        @$pins.isotope 'remove', pin.$el

    onSubmitForm: (ev) =>
        ev.preventDefault()
        @form.commit()
        @$control.hide()
        _.defer =>
            @$pins.isotope "reLayout", ->

    onBlurTitle: (ev) ->
        @model.set "title", $(ev.target).text()

    onKeydownTitle: (ev) ->
        if ev.which is 13
            @model.set "title", $(ev.target).text()

    ###
    View actions
    ###

    addPin: (model) =>
        pin = new PinView
            model: model
        @$pins.isotope 'insert', pin.$el
        pin.render()
        @$control.hide()

    highlightPin: (pin) ->
        @$el.find(".pin").each ->
            if @ != pin.el
                $(@).removeClass("editable")

    createForm: (pin) ->
        @form = new Backbone.Form
            model: pin.model
        @form.render()
        pin.model.bind 'change', (model,name) =>
            _.each name.changes, (value, key)=>
                if value
                    @form.setValue key, pin.model.get key
        @form.$el
            .find('form')
            .on 'submit', @onSubmitForm
        @$pinForm.empty()
        @$pinForm.append @form.$el

