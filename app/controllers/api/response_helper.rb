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



		end

		def paginated_collection(interactor)
			{
				data: interactor.result,
				page: interactor.result[:page]
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