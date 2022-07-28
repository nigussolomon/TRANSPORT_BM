require 'rails_helper'

RSpec.describe TransportOffer, type: :model do
  attributes = [
    {transport_bid: :belong_to},
    {transporter: :belong_to},
    {offer_date: :presence}
  ]

  include_examples('model_shared_spec', :transport_offer, attributes)
end
