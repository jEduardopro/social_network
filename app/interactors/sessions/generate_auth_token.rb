module Sessions
	class GenerateAuthToken
		include Integrations::Interactor

		def validate
			add_bad_request_error!('User not found') unless user.present?
		end

		def call
			set_result(JWT.encode(payload, secret_key))
		end

		private

		delegate :user, to: :context

		def payload
			{sub: user.uuid, iat: expiration, exp: expiration, data: token_data} 
		end

		def expiration
			24.hours.from_now.to_i
		end

		def token_data
			{uuid: user.uuid}
		end

		def secret_key
			'15e79b811f77118b69ed8d47661d0bf5a98923b3752dac62e19a1901538d95a2'
		end
	end
end