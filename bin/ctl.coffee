#!/usr/bin/env coffee

path    = require 'path'
forever = require 'forever'
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

service = new Service require(program.args[0])
service.listen(port: port)
