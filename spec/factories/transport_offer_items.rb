FactoryBot.define do
  factory :transport_offer_item do
    transport_offer factory: :transport_offer
    transport_bid_item factory: :transport_bid_item
    price { 100 }
    winner { nil }
    rank { nil }
  end
end
