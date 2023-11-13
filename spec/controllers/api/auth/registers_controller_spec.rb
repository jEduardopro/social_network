describe Api::Auth::RegistersController, type: :controller do

	describe "POST create" do
		subject { post :create, params: params }
		let(:params) do 
			{
				name: "John Doe",
				email: "john_doe@test.com",
				password: "password"
			}
		end
		context "when params are valid" do
			it "returns a new user and token" do
				subject
				expect(response).to have_http_status(:ok)
				expect(JSON.parse(response.body)['token']).to be_present
				expect(JSON.parse(response.body)['user']).to be_present
				expect(response.body).to include_json(
					user: User.last.as_json(only: [:name, :email])
				)
			end
		end

		context "when params are invalid" do
			let(:params) { {} }
			it "returns an error" do
				subject				
				expect(response).to have_http_status(:unprocessable_entity)
				expect(response.body).to include_json(
					error: {
						message: "Name is required"
					}
				)
			end
		end
	end
end