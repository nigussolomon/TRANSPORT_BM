require 'rails_helper'

RSpec.describe TransportPlan, type: :model do
  attributes = [
    {reference_no: %i[presence uniqueness]},
    {plan_type: :presence}
  ]

  include_examples('model_shared_spec', :transport_plan, attributes)

  it { is_expected.to(validate_inclusion_of(:plan_type).in_array(TransportPlan::PLAN_TYPES)) }

  it 'validates region is nil for Non Regional plans' do
    region =  create(:location)
    expect(build(:transport_plan, plan_type: TransportPlan::NON_REGIONAL, region: region)).not_to be_valid
  end

  it 'validates region cannot be nil for Regional plans' do
    expect(build(:transport_plan, region: nil)).not_to be_valid
  end

  it 'validates region can only be  of location type region' do
    region = create(:location)
    zone = create(:location, location_type: Location::ZONE, parent: region)
    expect(build(:transport_plan, region: zone)).not_to be_valid  
  
  end
end
