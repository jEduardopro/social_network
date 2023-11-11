describe Api::Statuses::StatusesController, type: :controller do
	include_context 'auth user'

	describe 'POST create' do
		subject { post :create, params: {body: 'my first status'} }
		let(:user) { create(:user) }

		context 'when a status is created' do
			it 'returns the status created' do
				subject
				expect(subject).to have_http_status(:ok)
				expect(response.body).to include_json(
					body: 'my first status',
				)
			end
		end
	end
end