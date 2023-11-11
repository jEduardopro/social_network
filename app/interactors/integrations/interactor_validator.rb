module Integrations
	module InteractorValidator
		extend ActiveSupport::Concern

		included do
			before :initializer
			before :validate
		end
	end
end