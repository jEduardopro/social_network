RSpec.shared_context 'auth user' do
	let(:auth_user) { create(:user) }
	let(:token) { SecureRandom.hex(8) }
	let(:encoded_token) { ActionController::HttpAuthentication::Token.encode_credentials(token) }
	let(:user_data) do
		{
			'data' => { 'uuid' => auth_user.uuid }
		}
	end

	before do
		controller.request.env['HTTP_AUTHORIZATION'] = encoded_token
		expect(Sessions::DecodeAuthToken).to receive(:call).with(token: token).and_return(double(success?: true, result: user_data))
	end
end