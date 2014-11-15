through = require 'through2'

module.exports = class Service
  # Service constructor
  # params: handler function
  #
  # handler accepts the message object from the request and whatever is returned
  # from the handler will be sent back to the returnChannel.
  constructor: (@handler) ->

  # graft compatible function which invokes the micro service handler.
  call: ->
    through.obj (msg, enc, callback) =>
      # run service
      @handler(msg)
      callback()

  # return true if a service is being called directly from node
  needsServer: ->
    for child in require.main.children
      return true if child == module
    false

  # start spdy server process to listen for incoming requests
  listen: (opts={}) ->
    require 'graft/spdy'
      .server opts
      .on 'ready', (server) ->
        address = server.address()
        console.log "Service listening on #{address.address}:#{address.port}"
      .pipe @call()
