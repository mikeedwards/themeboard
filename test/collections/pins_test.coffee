PinsCollection = require 'collections/pins'
PinModel = require 'models/pin'

describe 'Boardcollection', ->
    beforeEach ->
        @collection = new PinsCollection()

    it 'should be something', ->
        expect( @collection ).to.be.ok()

    it 'should be a PinsCollection', ->
        expect( @collection ).to.be.a PinsCollection

    it 'should have PinModel as model', ->
        model = new @collection.model()
        expect( model ).to.be.a PinModel