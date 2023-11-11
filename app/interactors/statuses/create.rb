module Statuses
	class Create
		include Integrations::Interactor

		BODY_MIN_LENGTH = 5
		BODY_MAX_LENGTH = 140

		def validate
			add_unprocessable_entity_error!('Body is required') if create_params[:body].blank?
			add_unprocessable_entity_error!('Body must have at least 5 characters') if create_params[:body].length < BODY_MIN_LENGTH
			add_unprocessable_entity_error!('Body must be less than 140 characters') if create_params[:body].length > BODY_MAX_LENGTH			
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