class StatusSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_name, :user_avatar, :ago

	def id
		object.uuid
	end

	belongs_to :user

	def user_name
		object.user.name
	end

	def user_avatar
		'https://aprendible.com/images/default-avatar.jpg'
	end

	def ago
		object.created_at.strftime('%d-%m-%Y %H:%M')
	end

end
