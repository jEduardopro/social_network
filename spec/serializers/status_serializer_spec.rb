describe StatusSerializer, type: :serializer do

	let(:status) { create(:status) }

	describe 'attributes' do
		subject { described_class.new(status).attributes.keys }
		it 'includes the expected attributes' do
			expect(subject).to contain_exactly(
				:id,
				:body,
				:user_name,
				:user_avatar,
				:ago
			)
		end
	end
	
	describe 'values' do
		let(:serializer) { described_class.new(status) }
		let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
		subject { JSON.parse(serialization.to_json) }
		it 'includes the expected values' do
			expect(subject['id']).to eq(status.uuid)
			expect(subject['body']).to eq(status.body)
			expect(subject['user_name']).to eq(status.user.name)
			expect(subject['user_avatar']).to eq('https://aprendible.com/images/default-avatar.jpg')
			expect(subject['ago']).to eq(status.created_at.strftime('%d-%m-%Y %H:%M'))
		end
	end
end