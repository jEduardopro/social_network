module Statuses
	class Create
		include Integrations::Interactor

		def validate
			add_unprocessable_entity_error!('Body is required') if create_params[:body].blank?
		end

		def call
			status = user.statuses.new(create_params)
			add_bad_request_error!(status.errors) unless status.save
			set_result(status)
		end

		private

		delegate :create_params, :user, to: :context

	end
end