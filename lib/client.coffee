graft = require('graft')()
ws    = require 'graft/ws'
spdy  = require 'graft/spdy'

module.exports = class Client
  constructor: (opts) ->
    @ret = graft.ReadChannel()
    # connect to micro-service
    # TODO spdy or ws? option?
    graft.pipe(spdy.client opts)

  write: (data) ->
    data.returnChannel = @ret
    graft.write data

  on: (event, handler) ->
    @ret.on event, (msg) ->
      handler?(msg)

