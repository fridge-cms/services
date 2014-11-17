service = require '../lib/service'
email   = require './email'

module.exports = service.use (graft) ->
  graft
    .where cmd: 'register', service.wrap (msg) ->
      console.log "Register command!"

    # attach micro service remotely
    # .where(cmd: 'email', spdy.client(port: 3001))

    # attach micro service locally
    .where(cmd: 'email', service.wrap email)
