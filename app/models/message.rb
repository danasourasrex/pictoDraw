class Message < ApplicationRecord
	#validates :username, presence: true
	#validates :message, presence: true, length: {minimum: 1}

	after_create_commit {MessageBroadcastJob.perform_later self}
end
