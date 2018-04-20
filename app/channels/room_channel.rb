class RoomChannel < ApplicationCable::Channel

  def subscribed
  	stream_from "room_channel"
  	

  	puts 'in subscribed'


  end

  def unsubscribed
  	puts 'in unsubscribed'
    
  end

  def speak(data)
    Message.create message: data['message'], username: data['username']


  end
end
