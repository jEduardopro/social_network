module Sessions
	class DecodeAuthToken
		include Integrations::Interactor

		def validate
			add_bad_request_error!('Token is not present') unless token.present?
		end

		def call
			set_result(JWT.decode(*args).first)
		rescue JWT::VerificationError,
					JWT::DecodeError,
					JWT::ExpiredSignature,
					OpenSSL::PKey::RSAError => e
				add_bad_request_error!(e.message)
		end

		private 

		delegate :token, to: :context

		def args
			[auth_token, signing_key]
		end

		def auth_token
			token.gsub('Bearer ', '')
		end

		def signing_key
			'15e79b811f77118b69ed8d47661d0bf5a98923b3752dac62e19a1901538d95a2'
		end

	end
end