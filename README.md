services
========

A series of micro services that can be used to react to Fridge data.

Start a service
-----

```bash
# start email micro service
$ forever start -c bin/ctl.coffee services/email.coffee --port 3000
```

Call a service using a client
-----

```bash
$ SENDGRID_USER='...' SENDGRID_KEY='...' coffee example.coffee
```
