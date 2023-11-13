module Auth
	class Register 
		include Integrations::Interactor

		def validate
			add_unprocessable_entity_error!('Name is required') if params[:name].blank?
			add_unprocessable_entity_error!('Email is required') if params[:email].blank?
			add_unprocessable_entity_error!('Password is required') if params[:password].blank?
		end

		def call
			@user = User.new(params)
			interactor = auth_token
			add_bad_request_error!(interactor.error) if interactor.failure?

			return set_result({token: interactor.result, user: UserSerializer.new(user)}) if user.save

			add_bad_request_error!(user.errors)
		end

		private 

		delegate :params, to: :context
		attr_reader :user

		def auth_token
			Sessions::GenerateAuthToken.call(user: user)
		end
	end
end