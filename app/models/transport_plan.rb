class TransportPlan < ApplicationRecord
  belongs_to :region, class_name: 'Location'

  REGIONAL = 'Regional'.freeze
  NON_REGIONAL = 'Non-Regional'.freeze

  PLAN_TYPES = [REGIONAL, NON_REGIONAL].freeze

  validates :reference_no, :plan_type, presence: true
  validates :reference_no, uniqueness: true

  validates :plan_type, inclusion: {:in => PLAN_TYPES}
  validate :plan_type_validation

  def plan_type_validation
    return unless region
    errors.add(:transport_plan, 'region cannot be nil for regional plan') if plan_type == REGIONAL && region.nil?
    errors.add(:transport_plan, 'region cannot be assigned for non regional plan') if plan_type == NON_REGIONAL && region != nil 
    errors.add(:transport_plan, 'region can only be of location type region') if region.location_type != Location::REGION
  end
end
