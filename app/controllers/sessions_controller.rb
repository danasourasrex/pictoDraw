class SessionsController < ApplicationController
  def new
    if session[:user_id] != nil
      redirect_to "/landing"
    end
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user and user[:password] == params[:password]
  		session[:user_id] = user.id
  		session[:username] = user.email
  		redirect_to "/landing", alert: 'success'

  	else
  		redirect_to "/login", notice: 'invalid username or password'
  	end
  end

  def destroy
  	session[:user_id] = nil
    session[:username] = nil
  	redirect_to "/login"
  end
end
