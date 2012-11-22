PinView = require 'views/pin'

describe 'PinView', ->
    beforeEach ->
        @view = new PinView()

    it "should exist", ->
        expect( @view ).to.be.ok()

    it "should destroy itself", (done) ->
        callback = (pin)->
            console.log "called"
            expect( pin ).to.not.be.ok() 
            done()

        @view.mediator = Backbone.Mediator
        @view.mediator.sub "pin:destroyed", callback, @view

        @view.model.bind 'destroy', (model, response) =>
            @view.mediator.publish "pin:destroyed", @view

        expect( @view ).to.be.ok()
        delete_pin = $ @view.$el.find '.delete-pin'
        delete_pin.click()
        #@view.mediator.pub "pin:destroyed", @view

