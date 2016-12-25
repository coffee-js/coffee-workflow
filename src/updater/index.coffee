
router = require './router'

module.exports = (store, action, actionData) ->
  switch action
    when 'router/go' then router.go store, actionData
    when 'router/nav' then router.nav store, actionData
    else store
