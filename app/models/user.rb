class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence:true, length: { minimum: 3, maximum: 10}
	validates :emails, presence:true, format: { with: VALID_EMAIL_REGEX}
end
