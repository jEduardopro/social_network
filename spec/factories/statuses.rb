FactoryBot.define do

	factory :status do
		user
		body { Faker::Lorem.sentence }
	end

end