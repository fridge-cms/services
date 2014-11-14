graft = require('graft')
ws = require 'graft/ws'

port = process.argv[2] || 3000

server = ws
  .server port: port
  .pipe graft()
  .where cmd: 'register', new Service (msg) =>
    console.log @

  # attach micro service remotely
  # .where(cmd: 'email', spdy.client(port: 3001))

  # attach micro service locally
  # .where(cmd: 'email', email)

