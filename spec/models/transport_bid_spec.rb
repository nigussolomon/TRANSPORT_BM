require 'rails_helper'

RSpec.describe TransportBid, type: :model do
  attributes = [
    {reference_no: %i[presence uniqueness]},
    {start_date: :presence},
    {opening_date: :presence},
    {end_date: :presence},
    {status: :presence},
    {bid_bond_amount: :presence},
    {transport_plan: :belong_to},
  ]

  include_examples('model_shared_spec', :transport_bid, attributes)

  it {is_expected.to(validate_numericality_of(:bid_bond_amount).is_greater_than(0))}
  it {is_expected.to(validate_inclusion_of(:status).in_array(TransportBid::STATUSES))}

  it 'validates start and end dates are not equal' do
    bid = build(:transport_bid, start_date: Date.today)
    expect(build(:transport_bid, end_date: Date.today)).not_to be_valid
  end

  it 'validates end date is not before start date' do
    bid = build(:transport_bid, start_date: Date.today, end_date: Date.yesterday)
    expect(bid).not_to be_valid
  end
  
end
