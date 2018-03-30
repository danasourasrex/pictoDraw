class Message < ApplicationRecord
	validates :username, presence: true
	validates :message, presence: true, length: {minimum: 1}
end
