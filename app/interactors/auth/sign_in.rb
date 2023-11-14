module Auth
	class SignIn
		include Integrations::Interactor

		def validate
			add_unprocessable_entity_error!('Email is required') if params[:email].blank?
			add_unprocessable_entity_error!('Password is required') if params[:password].blank?
			@user = User.find_by(email: params[:email])
			add_unprocessable_entity_error!('Invalid email or password') if user.blank? || !user.authenticate(params[:password])
		end

		def call		
			interactor = auth_token
			add_bad_request_error!(interactor.error) if interactor.failure?

			set_result({token: interactor.result, user: UserSerializer.new(user)})
		end

		private

		delegate :params, to: :context
		attr_reader :user

		def auth_token
			Sessions::GenerateAuthToken.call(user: user)
		end
	end
end