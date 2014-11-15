Client = require './lib/client'

client = new Client port: 3000

console.log process.env

client.write
  api_user: process.env.SENDGRID_USER
  api_key: process.env.SENDGRID_KEY
  to: ["tamagokun@gmail.com"]
  from: "mike@ripeworks.com"
  subject: "WEE"
  html: "<p>DUDE!!!</p>"

client.on 'data', (msg) ->
  console.log msg
