
React = require 'react'
recorder = require 'actions-in-recorder'
ReactDOM = require 'react-dom'
Immutable = require 'immutable'
installDevtools = require 'immutable-devtools'
pathUtil = require 'router-as-view/lib/path'

schema = require './schema'
routes = require './routes'
updater = require './updater/index'
Container = React.createFactory require('./app/container')

require './main.css'

render = (core) ->
  mountPoint = document.querySelector('#app')
  ReactDOM.render (Container store: core.get('store')), mountPoint

main = ->
  installDevtools Immutable
  router = pathUtil.parseAddress location.hash.replace(/#/, ''), routes

  recorder.setup
    initial: schema.store.set 'router', router
    updater: updater

  recorder.request render
  recorder.subscribe render

  console.log 'loaded'

window.onload = main

if module.hot
  module.hot.accept './app/container', ->
    Container = React.createFactory require('./app/container')
    recorder.request render
