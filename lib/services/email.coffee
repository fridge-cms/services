service = require '../service'

module.exports = email = service.create (msg) ->
  console.log "Hello from le micro service!"
  # what we need to send email
  # to
  # from
  # subject
  # message
  # attachments? <- streams?
  "STUFF"

email.listen(3001)
