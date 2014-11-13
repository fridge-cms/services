server = require './lib/server'

email = require './lib/services/email'

server(3000)
  # attach micro service remotely
  # .where(cmd: 'email', spdy.client(port: 3001))

  # attach micro service locally
  .where(cmd: 'email', email)

client = require './lib/client'
client.init('email', 3000)
client.write
  to: "tamagokun@gmail.com"
  from: "Some guy"
  message: "DUDE!!!"
client.on 'data', (msg) ->
  console.log msg
