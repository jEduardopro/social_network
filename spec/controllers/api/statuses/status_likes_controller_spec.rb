describe Api::Statuses::StatusLikesController, type: :controller do
	include_context 'auth user'

	describe "POST create" do
		subject { post :create, params: { id: status.uuid } }
		let!(:status) { create(:status) }

		context "when a status is liked" do
			it "returns the status liked" do				
				expect{subject}.to change(status.likes, :count).from(0).to(1)
				expect(response).to have_http_status(:ok)					
			end
		end
	end
end