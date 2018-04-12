App.time = App.cable.subscriptions.create "TimeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data

  speak: ->
    console.log data
