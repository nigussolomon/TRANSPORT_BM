FactoryBot.define do
  factory :transport_bid do
    reference_no { Faker::Code.npi }
    description { Faker::Lorem.paragraph }
    start_date { Date.today }
    end_date { Date.tomorrow }
    opening_date { Date.today }
    status { TransportBid::OPEN }
    bid_bond_amount { 100 }
    transport_plan factory: :transport_plan
  end
end
