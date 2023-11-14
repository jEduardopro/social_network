module Statuses
	class Index < Integrations::Paginator

		def index
			user.statuses		
		end

		private

		delegate :user, to: :context

	end
end