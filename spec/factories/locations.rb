FactoryBot.define do
  factory :location do
    code { Faker::Code.npi }
    name { Faker::Name.name }
    location_type { Location::REGION }
    description { Faker::Lorem.paragraph }
    ancestry { nil }
  end

  factory :zone, parent: :location, class: 'Location' do
    location_type { Location::ZONE }
    parent factory: :location
  end

  factory :woreda, parent: :location, class: 'Location' do
    location_type { Location::WOREDA }
    parent factory: :zone
  end
end
