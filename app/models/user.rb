class User < ApplicationRecord
	include HasUuid

	attr_accessor :password

	validates :uuid, presence: true, uniqueness: true
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	def password=(password_str)
		unless password_str.blank?
			@password = password_str
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(@password, password_salt)
		end
	end

end
