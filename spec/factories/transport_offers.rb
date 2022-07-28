FactoryBot.define do
  factory :transport_offer do
    transport_bid factory: :transport_bid
    transporter factory: :transporter
    offer_date { Date.today }
  end
end
