module Api
	module Statuses
		class StatusesController < AuthenticatedController
			include PaginationParams

			def index
				response_with_collection(
					interactor: ::Statuses::Index,
					params: {pagination_params:, user:},
					serializer: StatusSerializer
				)
			end

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