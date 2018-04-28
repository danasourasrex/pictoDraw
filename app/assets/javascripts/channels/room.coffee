App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  
    

  disconnected: ->
    
    
    
  update_score: (score, username) ->
    console.log score
    console.log username
    @perform 'update_score', score: score, username: username

 



  received: (data) ->
    $('#messages').prepend data['message']

  speak: (message, username)->
    @perform 'speak', message: message, username: username
    if message is word_to_guess and username != drawer
      App.room.update_score document.getElementById('timer').innerHTML, username
      $ endRound
    
    
    

$(document).on 'keypress','[data-behavior~=room_speaker]',(event)->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, document.getElementById('username').value
    event.target.value = ''
    event.preventDefault()