FactoryBot.define do
  factory :route do
    name { Faker::Name.name }
    region factory: :location
    source factory: :woreda
    destination factory: :zone
  end
end
