App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

    
  disconnected: ->
    
    

  received: (data) ->
    $('#messages').prepend data['message']

  speak: (message, username)->
    if message is document.getElementById('theWordtoGuess').innerHTML
      console.log 'success'
    console.log 'past if'
    @perform 'speak', message: message, username: username
    

$(document).on 'keypress','[data-behavior~=room_speaker]',(event)->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, document.getElementById('username').value
    event.target.value = ''
    event.preventDefault()