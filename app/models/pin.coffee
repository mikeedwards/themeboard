ImageModel = require '../models/image'

module.exports = class PinModel extends Backbone.DeepModel
    defaults:
        title: 'Title'
        description: ''
        image: null
    schema:
        title: 'Text'
        description: 'TextArea'
        image:
            type: 'NestedModel'
            model: ImageModel

    createImage: (source) ->
        @set "image", new ImageModel
            source: source
        @get "image"