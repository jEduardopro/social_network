describe User, type: :model do

	subject { create(:user) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
		it { should validate_uniqueness_of(:uuid) }
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
	end
end