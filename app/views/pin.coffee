View = require '../lib/view'
PinModel = require '../models/pin'
PinTemplate = require 'views/templates/pin'

module.exports = class PinView extends View
    className: "pin"
    template: PinTemplate
    editable: true

    model: new PinModel()

    events:
        "mousedown h2"      : "onMousedownH2"
        "focus h2"          : "onFocusH2"
        "blur h2"           : "onBlurH2"
        "keypress h2"       : "onKeypressH2"
        "click .delete-pin" : "onClickDeletePin"
        "click .comment"    : "onClickComment"
        "click"             : "onClick"
        #"hover"             : "onClick"

    ###
    View methods
    ###

    initialize: ->
        @mediator = Backbone.Mediator

        @model.bind 'change', (model, response) =>
            @render()

        @model.bind 'destroy', (model, response) =>
            @mediator.publish "pin:destroyed", @
            #@remove()

    afterRender: ->
        @select()

    ###
    View callbacks
    ###

    onClick: (ev) ->
        @editable = true
        @select()

    onClickDeletePin: (ev) ->
        @model.destroy()

    onClickComment: (ev) ->

    onMousedownH2: (ev) ->
        ev.stopPropagation()

    onFocusH2: (ev) ->
        @editable = true
        @select()

    onKeypressH2: (ev) ->
        if ev.which is 13
            @saveTitle $(ev.target).text()
            @editable = true
            @select()

    onBlurH2: (ev) ->
        @saveTitle $(ev.target).text()
        #@editable = false
        @$el.toggleClass "editable", @editable

    ###
    View actions
    ###

    select: ->
        @mediator.publish "pin:selected", @
        @$el.toggleClass "editable", @editable

    saveTitle: (title) ->
        @model.set "title", title
