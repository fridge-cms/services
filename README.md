services
========

A series of micro services that can be used to react to Fridge data.

Start a service
-----

```bash
# start email micro service
$ node_modules/.bin/forever start -c bin/ctl.coffee --port 3000
```

Call a service using a client
-----

```bash
$ SENDGRID_USER='...' SENDGRID_KEY='...' coffee example.coffee
```
