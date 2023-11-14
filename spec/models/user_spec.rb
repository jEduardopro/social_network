describe User, type: :model do

	subject { create(:user) }
	describe 'validations' do
		it { should validate_presence_of(:uuid) }
		it { should validate_uniqueness_of(:uuid) }
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
	end

	describe 'associations' do
		it { should have_many(:statuses).dependent(:destroy) }	
	end

	describe '.authenticate' do
		let!(:user) { create(:user) }
		context "when password is valid" do
			it "returns true" do
				expect(user.authenticate(user.password)).to be_truthy
			end
		end

		context "when password is invalid" do
			it "returns false" do
				expect(user.authenticate('invalid_password')).to be_falsy
			end
		end
	end
end