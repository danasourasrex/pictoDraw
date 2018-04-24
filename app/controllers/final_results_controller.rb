class FinalResultsController < ApplicationController

def index

@connected = ConnectedUser.all
@winner = @connected.first
@winner.wins += 1
@winner.save

end

end
