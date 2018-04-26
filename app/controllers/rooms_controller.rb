class RoomsController < ApplicationController
  def show
    if session[:user_id] == nil
      redirect_to "/login"
    end
    @start_game = false
  	@username = params[:usename]
  	@messages = Message.all
    @connected = ConnectedUser.all
    puts ConnectedUser.all
    if ConnectedUser.exists?(username: nil)
      ConnectedUser.find_by(username: nil).destroy
    end
    
   
   

    if ConnectedUser.exists?(username: session[:username])
      
    else
      ConnectedUser.create username: session[:username]
    end

  end




  
  def finalResults
    redirect_to '/finalResults'
  end
 

  

  def leave
    puts 'bye'
    
    ConnectedUser.find_by(username: session[:username]).destroy

    

  end

  def speak


    App.room.speak(message: params[:message])

  end

  def updateWordToGuess
    ActionCable.server.broadcast 'room_channel',
    word: params[:word],
    drawer: params[:drawer]
    head :ok
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
