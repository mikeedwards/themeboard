AppViewView = require 'views/app_view'

describe 'AppViewView', ->
    beforeEach ->
        ThemeBoard = {}
        @view = new AppViewView()

    it "should have a board view", ->
        expect( @view.board ).to.be.ok()

    it "should have a router", ->
        expect( @view.router ).to.be.ok()
