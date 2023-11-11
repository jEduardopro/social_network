module Api
	module Statuses
		class StatusesController < AuthenticatedController

			def create
				response_with_interactor(
					interactor: ::Statuses::Create,
					params: {create_params:, user:}
				)
			end

			private

			def create_params
				params.permit(:body)
			end

		end
	end
end