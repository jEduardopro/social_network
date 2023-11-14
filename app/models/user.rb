class User < ApplicationRecord
	include HasUuid

	attr_accessor :password

	validates :uuid, presence: true, uniqueness: true
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :statuses, dependent: :destroy

	def password=(password_str)
		unless password_str.blank?
			@password = password_str
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(@password, password_salt)
		end
	end

	def authenticate(password)
		password.present? && password_digest.present? && password_digest == BCrypt::Engine.hash_secret(password, password_salt)
	end

end
