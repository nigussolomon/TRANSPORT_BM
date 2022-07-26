require 'rails_helper'

RSpec.describe TransportPlanItem, type: :model do
  attributes = [
    {route: :belong_to},
    {quantity: :presence},
    {transport_plan: :belong_to},
    {unit: :belong_to},
  ]

  include_examples('model_shared_spec', :transport_plan_item, attributes)

  it { is_expected.to(validate_numericality_of(:quantity).is_greater_than(0))}
end
