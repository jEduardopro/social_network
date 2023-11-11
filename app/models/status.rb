class Status < ApplicationRecord
	include HasUuid

	validates :uuid, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 5, maximum: 140 }
	validates :user_id, presence: true

	belongs_to :user

end
