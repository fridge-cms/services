Service = require '../service'
_       = require 'lodash'
util    = require 'util'

# schema
# --------
# api_user
# api_key
# to
# from
# subject
# text
# html
# files
module.exports = new Service (msg) ->
  console.log "----> Email micro service"
  sendgrid = require('sendgrid')(msg.api_user, msg.api_key)
  email = new sendgrid.Email()

  msg.to = [msg.to] unless _.isArray msg.to
  email.addTo recipient for recipient in msg.to

  email.from    = msg.from
  email.subject = msg.subject
  email.text    = msg.text
  email.html    = msg.html

  sendgrid.send email, (err, json) ->
    msg.returnChannel.end if err
      util.inspect err
    else
      json
