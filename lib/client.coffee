graft = require('graft')()
ws    = require 'graft/ws'
spdy  = require 'graft/spdy'

class Client
  constructor: (opts) ->
    @res = graft.ReadChannel()
    # TODO spdy or ws? option?
    graft.pipe(spdy.client opts)

  write: (data) ->
    data.res = @res
    graft.write data

  on: (event, handler) ->
    @res.on event, (msg) ->
      handler?(msg)

module.exports =
  open: (opts) ->
    new Client(opts)
