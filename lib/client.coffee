graft = require('graft')()
ws    = require 'graft/ws'
_     = require 'lodash'
ret   = graft.ReadChannel()

module.exports =
  init: (cmd, port) ->
    # connect to micro-service
    graft.pipe(ws.client port: port)

  write: (data) ->
    graft.write _.extend data, cmd: @cmd

  on: (event, cb) ->
    ret.on event, (msg) ->
      cb?(msg)

