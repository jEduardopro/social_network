describe Api::Statuses::StatusesController, type: :controller do
	include_context 'auth user'

	describe 'GET index' do
		subject { get :index }
		let!(:statuses) { create_list(:status, 3, user: auth_user, created_at: 5.days.ago) }
		let!(:last_status) { create(:status, user: auth_user) }

		context 'when there are statuses' do
			it 'returns the statuses paginated' do
				subject
				expect(subject).to have_http_status(:ok)
				expect(response.body).to include_json(
					page: 1,
					per_page: 15,					
				)
				parse_body = JSON.parse(response.body)
				expect(parse_body['data'].size).to eq(4)
				expect(parse_body['data'][0]['id']).to eq(last_status.id)
			end
		end
	end

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