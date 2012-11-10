View = require '../lib/view'
ImageModel = require '../models/image'

module.exports = class ImageView extends View
    template: require 'views/templates/image'

    model: new ImageModel()
