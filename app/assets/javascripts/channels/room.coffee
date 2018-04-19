App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

    
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').prepend data['message']

  speak: (message, username)->
    console.log message
    console.log username
    @perform 'speak', message: message, username: username

$(document).on 'keypress','[data-behavior~=room_speaker]',(event)->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, document.getElementById('username').value
    event.target.value = ''
    event.preventDefault()