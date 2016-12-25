
React = require 'react'
recorder = require 'actions-in-recorder'

Addressbar = React.createFactory require 'router-as-view'
Sidebar = React.createFactory require './sidebar'
Doc = React.createFactory require './doc'

routes = require '../routes'

{div} = React.DOM

module.exports = React.createClass
  displayName: 'app-container'

  render: ->
    div className: 'app-container',
      Sidebar()
      Doc()
      Addressbar
        router: @props.store.get('router')
        routes: routes
        onPopstate: (info, event) ->
          recorder.dispatch 'router/go', info
        inHash: true
        skipRendering: false
