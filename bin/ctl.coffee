#!/usr/bin/env coffee

path    = require 'path'
_       = require 'lodash'
Service = require '../lib/service'

root = path.dirname __dirname
pkg = require path.join(root, 'package.json')

program = require 'commander'
program
  .version pkg.version
  .usage '<file> [options]'
  .option '-p, --port <port>', 'port to listen on'
  .parse process.argv

port = program.port || 3000

unless program.args.length
  program.help()
  process.exit()

service = require program.args[0]

if _.isFunction service
  new Service(service).listen(port: port)
else
  service.listen(port: port)
