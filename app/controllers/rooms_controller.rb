class RoomsController < ApplicationController
  def show
  	@username = params[:usename]
  	@messages = Message.all
    @connected = ConnectedUser.all
    

    if ConnectedUser.exists?(username: session[:username])
      
    else
      ConnectedUser.create username: session[:username]
    end
    



    @word = Word.find_by(id:(rand(1..80)))


  end

  def leave
    puts 'bye'
    ConnectedUser.find_by(username: session[:username]).destroy

  end

  def speak
  	 App.room.speak(message: params[:message])
  end

  def updateUsersInLobby
    puts 'hi'
    @connected = ConnectedUser.all
  end

  def draw
  	 ActionCable.server.broadcast 'room_channel',
    	fromx: params[:fromx],
    	fromy: params[:fromy],
    	tox: params[:tox],
    	toy: params[:toy],
    	color: params[:color],
      lineThick: params[:lineThick]
  		head :ok
	end

	def clear
	 ActionCable.server.broadcast 'room_channel',
    	fromx: params[:fromx],
    	fromy: params[:fromy],
    	tox: params[:tox],
    	toy: params[:toy],
    	color: params[:color]
  		head :ok

	end

  def time
    ActionCable.server.broadcast 'room_channel',
    time: params[:time]
    head :ok
  end

end
