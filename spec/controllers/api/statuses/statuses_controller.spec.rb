describe Api::Statuses::StatusesController, type: :controller do
	include_context 'auth user'

	describe 'POST create' do
		subject { post :create, params: {body: body } }
		let(:body) { 'my first status' }

		context 'when a status is created' do
			it 'returns the status created' do
				subject
				expect(subject).to have_http_status(:ok)
				expect(response.body).to include_json(
					user_id: auth_user.id,
					body: body,
				)
			end
		end

		context 'when the body is invalid' do
			let(:body) { '' }
			it 'returns an error' do 
				subject
				expect(subject).to have_http_status(:unprocessable_entity)
			end
		end

		context 'when the body does not have at least 5 characters' do
			let(:body) { 'hi' }
			it 'returns an error' do
				subject
				expect(subject).to have_http_status(:unprocessable_entity)
			end
		end

		context 'when the body have more 140 characters' do
			let(:body) { 'a' * 141 }
			it 'returns an error' do
				subject
				expect(subject).to have_http_status(:unprocessable_entity)
			end
		end
	end
end