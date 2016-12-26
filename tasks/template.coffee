
stir = require('stir-template')
React = require 'react'
ReactDOM = require 'react-dom/server'
pathUtil = require 'router-as-view/lib/path'

routes = require '../src/routes'
schema = require '../src/schema'
settings = require('./settings')
resource = require('./resource')
Container = React.createFactory require('../src/app/container')

{html, head, title, meta, link, script, body, div} = stir

style = stir.createFactory 'style'

logoUrl = 'http://logo.cirru.org/cirru-32x32.png'

module.exports = (env) ->
  config = settings.get(env)
  assets = resource.get(config)
  router = pathUtil.parseAddress '/', routes
  store = schema.store.set 'router', router

  stir.render stir.doctype,
    html {},
      head {},
        title {}, 'Workflow'
        meta charset: 'utf-8'
        link rel: 'icon', href: logoUrl
        if assets.style?
          link rel: 'stylesheet', href: assets.style
        script src: assets.vendor, defer: true
        script src: assets.main, defer: true
        style {}, 'body * {box-sizing: border-box;}'
    body style: 'margin: 0;',
      div id: 'app',
        ReactDOM.renderToString Container(store: store)
