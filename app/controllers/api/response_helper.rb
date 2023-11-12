module Api
	module ResponseHelper

		def response_with_interactor(interactor:, params:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?
			render_success(interactor.result, :ok)
		end

		def response_with_collection(interactor:, params:)
			interactor = interactor.call(params)
			return render_error(interactor.error) if interactor.failure?
			
			data = paginated_collection_formatted(interactor)
			render json: data, status: :ok
		end

		def paginated_collection_formatted(interactor)
			{
				data: interactor.result[:collection],
				page: interactor.result[:page].to_i,
				per_page: interactor.result[:per_page].to_i,
				total_pages: interactor.result[:total_pages].to_i,
				next_page: interactor.result[:next_page].to_i
			}
		end

		def render_error(error)
			render json: {error:}, status: error.status
		end

		def render_success(result, status)
			render json: result, status:
		end

	end
end