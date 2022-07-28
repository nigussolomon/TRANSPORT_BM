require 'rails_helper'

RSpec.describe TransportBidItem, type: :model do
  attributes = [
    {transport_bid: :belong_to},
    {transport_plan_item: :belong_to},
    {quantity: :presence},
    {unit: :belong_to},
  ]

  include_examples('model_shared_spec', :transport_bid_item, attributes)

  it {is_expected.to(validate_numericality_of(:quantity).is_greater_than(0))}
end
