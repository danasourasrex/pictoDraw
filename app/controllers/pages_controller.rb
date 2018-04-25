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

  def leaderboard
    @users = User.order('gameswon DESC')
  end
  def admin
    
    @user = @user = User.find_by(id: session[:user_id])
    @users = User.all
    @messages = Message.all
    @connected = ConnectedUser.all
    @words = Word.all
    if @user.email != 'danasourasrex'
     put @user.email
    end

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
    @user = User.find_by(id: session[:user_id])
  end




  def about
  end
end
