client = require './lib/client'

email = client.open port: 3000

email.write
  api_user: process.env.SENDGRID_USER
  api_key: process.env.SENDGRID_KEY
  to: ["tamagokun@gmail.com"]
  from: "mike@ripeworks.com"
  subject: "WEE"
  html: "<p>DUDE!!!</p>"

email.on 'data', (msg) ->
  console.log msg
