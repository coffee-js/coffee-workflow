
React = require 'react'
recorder = require 'actions-in-recorder'
ReactDOM = require 'react-dom'
Immutable = require 'immutable'
installDevtools = require 'immutable-devtools'

Container = React.createFactory require('./app/container')

require './main.css'

updater = (store, op, opData) ->
  store + 1

render = (core) ->
  mountPoint = document.querySelector('#app')
  ReactDOM.render (Container store: core.get('store')), mountPoint

main = ->
  installDevtools Immutable

  recorder.setup
    initial: 0
    updater: updater

  recorder.request render
  recorder.subscribe render

  console.log 'loaded'

window.onload = main

if module.hot
  module.hot.accept './app/container', ->
    Container = React.createFactory require('./app/container')
    recorder.request render
