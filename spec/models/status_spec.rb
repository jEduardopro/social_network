describe Status, type: :model do

	subject { create(:status) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
		it { should validate_uniqueness_of(:uuid) }
		it { should validate_presence_of(:body) }
		it { should validate_presence_of(:user_id) }
	end

	describe 'associations' do
		it { should belong_to(:user) }
	end

end