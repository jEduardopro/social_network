describe Api::Auth::LoginsController, type: :controller do

	describe "POST sign_in" do
		subject { post :sign_in, params: params }
		let!(:user) {create(:user)}
		let(:params) { {email: user.email, password: user.password} }

		context "when params are valid" do
			it "returns a logged in user and token" do
				subject						
				expect(response).to have_http_status(:ok)
				expect(JSON.parse(response.body)['token']).to be_present
				expect(JSON.parse(response.body)['user']).to be_present
			end
		end

		context "when params are invalid" do
			let(:params) { {} }
			it "returns an error" do
				subject
				expect(response).to have_http_status(:unprocessable_entity)
				expect(response.body).to include_json(
					error: {
						message: "Email is required"
					}
				)
			end
		end
	end
end