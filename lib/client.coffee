graft = require('graft')()
ws    = require 'graft/ws'
spdy  = require 'graft/spdy'

module.exports = class Client
  constructor: (opts) ->
    @res = graft.ReadChannel()
    # connect to micro-service
    # TODO spdy or ws? option?
    graft.pipe(spdy.client opts)

  write: (data) ->
    data.res = @res
    graft.write data

  on: (event, handler) ->
    @res.on event, (msg) ->
      handler?(msg)

