class RoomsController < ApplicationController
  def show
  	@username = params[:usename]
  	@messages = Message.all
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
    	color: params[:color]
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

end
