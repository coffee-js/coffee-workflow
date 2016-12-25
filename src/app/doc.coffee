
React = require 'react'
recorder = require 'actions-in-recorder'

{div} = React.DOM

onHome = ->
  recorder.dispatch 'router/nav', '/'

onDemo = ->
  recorder.dispatch 'router/nav', '/demo'

module.exports = React.createClass
  render: ->
    div null, 'doc',
      div onClick: onHome, 'Home'
      div onClick: onDemo, 'Demo'
