expect = require 'expect.js'
jQuery = require "jQuery"
lodash = global._ = require "lodash"
Backbone = global.Backbone = require "backbone"
Backbone = require "../vendor/scripts/backbone.mediator"

module.exports =
  expect: expect
  $: jQuery
  # _: lodash
  #Backbone: Backbone
