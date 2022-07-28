class TransportBid < ApplicationRecord
  belongs_to :transport_plan

  NEW = 'New'.freeze
  OPEN = 'Open'.freeze
  CLOSED = 'Closed'.freeze
  RANKED = 'Ranked'.freeze
  WINNERS_DECLARED = 'Winner Declared'.freeze


  STATUSES = [NEW, OPEN, CLOSED, RANKED, WINNERS_DECLARED].freeze

  validates :reference_no, :start_date, :end_date, :opening_date, :status, :bid_bond_amount ,  presence: true
  validates :bid_bond_amount, numericality: {only_integer: true, greater_than: 0}
  validates :reference_no, uniqueness: true
  validates :status, inclusion: {:in => STATUSES}
  validate :date_validations

  def date_validations
    return unless start_date && end_date
    
    errors.add(:transport_bid, 'End Date cannot be before Start Date') if start_date >= end_date
  end
end
