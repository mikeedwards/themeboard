View = require '../lib/view'
PinsCollection = require 'collections/pins'

module.exports = class PinsView extends View
    template: require 'views/templates/pins'

    className: PinsCollection
