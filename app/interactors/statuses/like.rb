module Statuses
	class Like
		include Integrations::Interactor

		def validate
			@status = Status.find_by(uuid: status_id)
			add_bad_request_error!('Status not found') if status.blank?
		end
		
		def call
			like = status.likes.new(user_id: user.id)
			add_bad_request_error!(like.errors) unless like.save
			set_result(like)
		end

		private

		delegate :status_id, :user, to: :context
		attr_reader :status

	end
end