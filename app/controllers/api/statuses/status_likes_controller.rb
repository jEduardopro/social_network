module Api
	module Statuses
		class StatusLikesController < AuthenticatedController

			def create
				response_with_data(
					interactor: ::Statuses::Like,
					params: { status_id: params[:id], user:}
				)
			end

		end
	end
end
