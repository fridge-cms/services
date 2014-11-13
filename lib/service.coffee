through = require 'through2'

module.exports = class Service
  # convenience function to create new services
  # service.create(function(msg) { ... })
  @create: (f) ->
    new Service(f)

  # Service constructor
  # params: handler function
  #
  # handler accepts the message object from the request and whatever is returned
  # from the handler will be sent back to the returnChannel.
  constructor: (@f) ->

  # graft compatible function which invokes the micro service handler.
  call: ->
    through.obj (msg, enc, cb) ->
      # run service
      msg.returnChannel.end @f?(msg)
      cb()

  # start spdy server process to listen for incoming requests
  listen: (port) ->
    port = process.argv[2] || port
    require 'graft/spdy'
      .server port: port
      .on 'ready', ->
        console.log "Service listening on port", port
      .pipe @call()
