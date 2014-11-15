services
========

A series of micro services that can be used to react to Fridge data.

Start a service
-----

```bash
# start email micro service
$ node_modules/.bin/forever start -c coffee lib/services/email.coffee 3000
```

Call a service
-----

```bash
$ SENDGRID_USER='...' SENDGRID_KEY='...' coffee example.coffee
```
