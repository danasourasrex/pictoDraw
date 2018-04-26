class FinalResultsController < ApplicationController

def index

@connected = ConnectedUser.order('score DESC')
@sorted = ConnectedUser.order('score DESC')
@winner = User.find_by(email: @sorted.first.username)
@winner.gameswon += 1
@winner.save
@connected.each do |player|
	@temp = User.find_by(email: player.username)
	@temp.gamesplayed += 1
	@temp.save
end

end

def deleteall
	ConnectedUser.destroy_all
end

end
