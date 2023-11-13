module Api
	module Auth
		class RegistersController < ApplicationController
	
			def create
				response_with_data(
					interactor: ::Auth::Register,
					params: {params: register_params}
				)
			end
	
			private
	
			def register_params
				params.permit(:name, :email, :password)
			end
		end
	end
end