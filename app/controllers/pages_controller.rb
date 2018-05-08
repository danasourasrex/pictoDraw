class PagesController < ApplicationController
  def home
    #makes sure that if the user is not logged in they do not see the landing screen
  	if session[:user_id] != nil
  		redirect_to "/landing"
  	end

  end

  def wordData
    #Gets all words in database
  	@words = Word.all
  end

  def leaderboard
    #Sort users in decending order of Games won
    @users = User.order('gameswon DESC')

  end
  def admin
    #@user is used to make sure that the user can view the page
    @user = User.find_by(id: session[:user_id])

    #Gets all users, messages, connected users, and words.
    @users = User.all
    @messages = Message.all
    @connected = ConnectedUser.all
    @words = Word.all

  end

  def wordDataCreate
     #Creates new word
	   @message = Word.new
     #Adds word data
	   @message.assign_attributes({:word => params[:word]})
     #saves word
	   @message.save
     #refreshes admin page
     redirect_to '/admin'
  end

  def landingPage
    #Get user to show stats
    @user = User.find_by(id: session[:user_id])
    #additional code used to disconnect user from lobby
    if ConnectedUser.exists?(username: session[:username])
      ConnectedUser.find_by(username: session[:username]).destroy
      
  end

  end




  def about
  end
end
