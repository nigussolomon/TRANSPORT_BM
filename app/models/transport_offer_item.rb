class TransportOfferItem < ApplicationRecord
  belongs_to :transport_offer
  belongs_to :transport_bid_item

  validates :price, presence: true, numericality: { greater_than: 0}
end
