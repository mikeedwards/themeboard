View = require '../lib/view'
CommentModel = require '../models/comment'

module.exports = class CommentView extends View
    template: require 'views/templates/comment'

    model: new CommentModel()
