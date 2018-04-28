class RoomChannel < ApplicationCable::Channel

  def subscribed
  	stream_from "room_channel"
  	

  	puts 'in subscribed'


  end

  def unsubscribed
    puts 'unsub'

  end

  def update_score(data)
    puts data['score']
    puts data['username']
    @user = ConnectedUser.find_by(username: data['username'])
    @user.score += Integer(data['score'])
    puts @user.score
    @user.save
  end



  def speak(data)
    Message.create message: data['message'], username: data['username']


  end
end
