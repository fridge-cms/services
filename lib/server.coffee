graft = require('graft')()
ws = require 'graft/ws'

module.exports = (port) ->
  ws
    .server port: port
    .pipe graft
