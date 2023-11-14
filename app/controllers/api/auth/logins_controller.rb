module Api
	module Auth
		class LoginsController < ApplicationController

			def sign_in
				response_with_data(
					interactor: ::Auth::SignIn,
					params: {params: sign_in_params}
				)
			end

			private

			def sign_in_params
				params.permit(:email, :password)
			end

		end
	end
end