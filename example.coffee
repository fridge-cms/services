Client = require './lib/client'

client = new Client port: 3000

client.write
  to: "tamagokun@gmail.com"
  from: "Some guy"
  message: "DUDE!!!"

client.on 'data', (msg) ->
  console.log msg
