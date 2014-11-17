through = require 'through2'
graft   = require 'graft'

module.exports = class Service
  # Service constructor
  # params: handler function, graft instance
  #
  # handler accepts the message object from the request and whatever is returned
  # from the handler will be sent back to the returnChannel.
  constructor: (@handler, @graft=null) ->

  # stream which server will pipe to. will either be a wrapped function
  # or a graft instance.
  call: ->
    return @graft unless @handler
    Service.wrap @handler

  # start spdy server process to listen for incoming requests
  listen: (opts={}) ->
    require 'graft/spdy'
      .server opts
      .on 'ready', (server) ->
        address = server.address()
        console.log "Service listening on #{address.address}:#{address.port}"
      .pipe @call()

  @use: (callback) ->
    new Service false, callback(graft())

  @wrap: (handler) ->
    through.obj (msg, enc, callback) ->
      # run service
      handler(msg, enc)
      callback()
