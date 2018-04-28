class FinalResultsController < ApplicationController

def index
if ConnectedUser.exists?(username: session[:username])
@connected = ConnectedUser.order('score DESC')

#ConnectedUser.find_by(username: session[:username]).destroy
else

redirect_to "/landing"


end
end

def landing
redirect_to '/landing'
end

def deleteall
	ConnectedUser.destroy_all
end
end



