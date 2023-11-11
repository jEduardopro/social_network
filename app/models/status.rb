class Status < ApplicationRecord
	include HasUuid

	validates :uuid, presence: true

	belongs_to :user

end
