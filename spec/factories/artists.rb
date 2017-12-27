FactoryBot.define do
  factory :artist do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    bio         { Faker::Lorem.sentence }
  end
end
