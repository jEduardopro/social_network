module Integrations

	class Paginator
		include Integrations::Interactor

		def call
			add_bad_request_error!('Pagination params are missing') unless pagination_params.present?

			set_result(paginated_collection)
		end

		def index
			raise NotImplementedError
		end

		private 

		delegate :pagination_params, to: :context

		def paginated_collection
			{
				collection: collection,
				page: pagination_params[:page],
				per_page: pagination_params[:per_page],
				total_pages: collection.total_pages,
				next_page: collection.next_page,
			}
		end

		def collection
			index.order("#{pagination_params[:sort_by]} #{pagination_params[:sort_direction]}")
				.page(pagination_params[:page])
				.per(pagination_params[:per_page])
		end

	end
end