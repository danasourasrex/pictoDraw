class PagesController < ApplicationController
  def home
  	if session[:user_id] != nil
  		redirect_to "/landing"
  	end
  end

  def about
  end
end
