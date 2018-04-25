class FinalResultsController < ApplicationController

def index

@connected = ConnectedUser.all
@winner = @connected.first
@winner.wins += 1
@winner.save

end

def deleteall
	ConnectedUser.destroy_all
end

end
