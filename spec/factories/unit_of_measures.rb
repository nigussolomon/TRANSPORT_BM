FactoryBot.define do
  factory :unit_of_measure do
    name { Faker::Name.name }
    unit_type { UnitOfMeasure::WEIGHT }
    abbreviation { Faker::Name.name }
  end
end
