PinModel = require 'models/pin'
ImageModel = require 'models/image'

describe 'PinModel', ->
    beforeEach ->
        @model = new PinModel()

    it "should be a PinModel", ->
        expect( @model ).to.be.a PinModel

    it "should have a \"Title\" as a default title", ->
        expect( @model.attributes ).to.have.property "title"
        expect( @model.get "title" ).to.be "Title"

    it "should have an empty default description", ->
        expect( @model.attributes ).to.have.property "description"
        expect( @model.get "description" ).to.be ''

    it "should have a null default image", ->
        expect( @model.attributes ).to.have.property "image"
        expect( @model.get "image" ).to.be null

    it "should create a image from a source URL", ->
        image = @model.get "image"
        expect( image ).to.be null
        
        image = @model.createImage "https://www.google.com/images/srpr/logo3w.png"
        expect( image ).to.be.an ImageModel
        expect( image.get "source" )
            .to.be "https://www.google.com/images/srpr/logo3w.png"

        image = @model.get "image"
        expect( image ).to.be.an ImageModel
        expect( image.get "source" )
            .to.be "https://www.google.com/images/srpr/logo3w.png"
