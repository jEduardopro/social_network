module PaginationParams

	SORT_DIRECTION = {
		asc: 'asc',
		desc: 'desc'
	}.freeze
	DEFAULT_PAGE =1
	DEFAILT_SORT_BY = 'created_at'
	DEFAULT_SORT_DIRECTION = SORT_DIRECTION[:desc]
	DEFAULT_PER_PAGE = 15

	def pagination_params
		{
			page: params[:page] || DEFAULT_PAGE,
			per_page: params[:per_page] || DEFAULT_PER_PAGE,
			sort_by: params[:sort_by] || DEFAILT_SORT_BY,
			sort_direction: params[:sort_direction] || DEFAULT_SORT_DIRECTION
		}
	end

end