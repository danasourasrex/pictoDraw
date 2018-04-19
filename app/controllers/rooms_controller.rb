class RoomsController < ApplicationController
  def show
  	@username = params[:usename]
  	@messages = Message.all
<<<<<<< HEAD
    


=======
    @word = Word.find_by(id:(rand(1..80)))
>>>>>>> 156789903718dc287f08013bce44b52142b6b524
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
