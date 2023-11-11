module Statuses
	class Create
		include Integrations::Interactor

		def call
			status = user.statuses.new(create_params)
			add_bad_request_error!(status.errors) unless status.save
			set_result(status)
		end

		private

		delegate :create_params, :user, to: :context

	end
end