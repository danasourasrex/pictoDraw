class PagesController < ApplicationController
  def home
  	if session[:user_id] != nil
  		redirect_to "/landing"
      
  	end

  end

  def wordData
  	@words = Word.all
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
    if @user.email != 'danasourasrex' || @user.email != 'mike'
     puts @user.email
    end

  end

  def wordDataCreate
	@message = Word.new
	@message.assign_attributes({:word => params[:word]})
	@message.save
  redirect_to '/admin'
  end

  def landingPage
    puts 'in here'
    puts session[:username]
    if session[:user_id] != nil
    if ConnectedUser.exists?(username: session[:username])
      ConnectedUser.find_by(username: session[:username]).destroy
    end
    @user = User.find_by(id: session[:user_id])
  else 
    redirect_to "/home"
  end

  end




  def about
  end
end
