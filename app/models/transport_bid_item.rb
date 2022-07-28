class TransportBidItem < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transport_plan_item
  belongs_to :unit, class_name: 'UnitOfMeasure'

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
end
