describe UserSerializer, type: :serializer do
	let(:user) { create(:user) }

	describe 'attributes' do
		subject { described_class.new(user).attributes.keys }
		it 'includes the expected attributes' do
			expect(subject).to contain_exactly(
				:id,
				:name,
				:email
			)
		end
	end

	describe 'values' do
		let(:serializer) { described_class.new(user) }
		let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
		subject { JSON.parse(serialization.to_json) }
		it 'includes the expected values' do
			expect(subject['id']).to eq(user.uuid)
			expect(subject['name']).to eq(user.name)
			expect(subject['email']).to eq(user.email)
		end
	end

end