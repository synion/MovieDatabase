FactoryGirl.define do
  factory :movie do
    name { Faker::Name.name }
    revenue { Faker::Number.digit }
  end
end
