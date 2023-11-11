describe Api::Statuses::StatusesController, type: :controller do
	include_context 'auth user'

	describe 'POST create' do
		subject { post :create, params: {body: body } }
		let(:user) { create(:user) }
		let(:body) { 'my first status' }

		context 'when a status is created' do
			it 'returns the status created' do
				subject
				expect(subject).to have_http_status(:ok)
				expect(response.body).to include_json(
					body: body,
				)
			end
		end
	end
end