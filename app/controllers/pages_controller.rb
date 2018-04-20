class PagesController < ApplicationController
  def home

  	if session[:user_id] != nil
  		redirect_to "/landing"
      
  	end
  end

  def wordData
  	@words = Word.all
  end

  def wordDataNew

  end

  def wordDataCreate
	@message = Word.new
	@message.assign_attributes({:word => params[:word]})
	@message.save
	redirect_to "/addWord"
  end

  def landingPage
    puts 'in here'
    puts session[:username]
    if ConnectedUser.exists?(username: session[:username])
      ConnectedUser.find_by(username: session[:username]).destroy
    end

  end




  def about
  end
end
