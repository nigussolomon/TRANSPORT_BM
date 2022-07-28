require 'rails_helper'

RSpec.describe TransportOfferItem, type: :model do
  attributes = [
    {transport_offer: :belong_to},
    {transport_bid_item: :belong_to},
    {price: :presence},
  ]

  include_examples('model_shared_spec', :transport_offer_item, attributes)

  it { is_expected.to(validate_numericality_of(:price).is_greater_than(0))}
end
