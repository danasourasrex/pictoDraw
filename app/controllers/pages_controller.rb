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


  def about
  end
end
