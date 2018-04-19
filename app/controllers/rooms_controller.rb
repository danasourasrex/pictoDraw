class RoomsController < ApplicationController
  def show
  	@username = params[:usename]
  	@messages = Message.all
    if ConnectedUser.exists?(session[:user_id])
      
    else
      ConnectedUser.create username: session[:username]
    end
    @connected = ConnectedUser.all


    @word = Word.find_by(id:(rand(1..80)))

  end

  def leave
    ConnectedUser.find_by(username: session[:username]).destroy
  end

  def speak
  	App.room.speak(message: params[:message])
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
