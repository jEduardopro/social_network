class Status < ApplicationRecord
	include HasUuid

	validates :uuid, presence: true, uniqueness: true
	validates :body, presence: true
	validates :user_id, presence: true

	belongs_to :user

end
