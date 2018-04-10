class RoomsController < ApplicationController
  def show
  	@username = params[:usename]
  	@messages = Message.all
  end
  def speak
  	App.room.speak(message: params[:message])
  end

end
