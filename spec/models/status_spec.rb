describe Status, type: :model do

	subject { create(:status) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
		it { should validate_uniqueness_of(:uuid) }
		it { should validate_presence_of(:body) }
		it { should validate_length_of(:body).is_at_least(5) }
		it { should validate_length_of(:body).is_at_most(140) }
		it { should validate_presence_of(:user_id) }
	end

	describe 'associations' do
		it { should belong_to(:user) }
	end

end