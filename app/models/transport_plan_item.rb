class TransportPlanItem < ApplicationRecord
  belongs_to :route, class_name: 'Route'
  belongs_to :transport_plan, class_name: 'TransportPlan'
  belongs_to :unit, class_name: 'UnitOfMeasure'

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
end
