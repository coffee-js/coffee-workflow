
pathUtil = require 'router-as-view/lib/path'
routes = require '../routes'

exports.go = (store, actionData) ->
  store.set 'router', actionData

exports.nav = (store, actionData) ->
  router = pathUtil.parseAddress actionData, routes
  store.set 'router', router
