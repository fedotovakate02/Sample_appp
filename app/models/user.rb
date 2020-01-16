class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	before_save :to_lower_case

	validates :name, presence:true, length: { maximum: 10}
	validates :emails, presence:true, format: { with: VALID_EMAIL_REGEX},
						uniqueness: {case_sensative: false}

	has_secure_password

	private

	def to_lower_case
		self.emails = emails.downcase
	end
end
