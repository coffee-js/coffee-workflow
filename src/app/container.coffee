
React = require 'react'
recorder = require 'actions-in-recorder'

{div} = React.DOM

module.exports = React.createClass
  displayName: 'app-container'

  onClick: ->
    recorder.dispatch 'inc', null

  render: ->
    div className: 'app-container', onClick: @onClick,
      @props.store
