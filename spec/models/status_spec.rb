describe Status, type: :model do

	subject { create(:status) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
	end

	describe 'associations' do
		it { should belong_to(:user) }
	end

end