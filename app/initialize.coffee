# App Namespace
@ThemeBoard ?= {}
ThemeBoard.Routers ?= {}
ThemeBoard.Views ?= {}
ThemeBoard.Models ?= {}
ThemeBoard.Collections ?= {}

$ ->
    # Load App Helpers
    require '../lib/app_helpers'

    # Initialize App
    ThemeBoard?.Views?.AppView = new AppView = require 'views/app_view'

    # Initialize Backbone History
    Backbone.history.start pushState: yes
