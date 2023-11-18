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
			Rails.application.credentials.config[:jwt_secret_key]
		end

	end
end