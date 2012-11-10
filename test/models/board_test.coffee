BoardModel = require 'models/board'

describe 'BoardModel', ->
    beforeEach ->
        @model = new BoardModel()

    it "should be a BoardModel", ->
        expect( @model ).to.be.a BoardModel

    it "should have a \"New theme\" as a default title", ->
        expect( @model.attributes ).to.have.property "title"
        expect( @model.get "title" ).to.be "New theme"

