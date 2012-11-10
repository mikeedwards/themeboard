View      = require '../lib/view'
AppRouter = require '../routers/app_router'
BoardView     = require './board'

module.exports = class AppView extends View
    el: 'body.application'
    
    initialize: ->
        @router = new AppRouter()
        ThemeBoard?.Routers?.AppRouter = @router
        @board = new BoardView()
        ThemeBoard?.Views?.BoardView = @board
        super()

    afterRender: ->
        @$el.append @board.$el
