BoardView = require 'views/board'

describe 'BoardView', ->
    console = {}

    console.log = console.info = (t)->
      process.stdout.write(t + '\n');

    window.console = console


    beforeEach ->
        @view = new BoardView()

    it "should have the default model title", ->
        headline = $(@view.$el.find('h1')[0]).text()
        expect( headline ).to.be "New theme"
