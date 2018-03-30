class ChatTestController < ApplicationController
  def chatbox
  	#@messages = Message.except(@messages)
  	@messages = Message.all
  end
  def sendmessage
  end
  def recievemessage
  end

  def update
  	
  end
end
