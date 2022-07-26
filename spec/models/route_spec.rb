require 'rails_helper'

RSpec.describe Route, type: :model do
  attributes = [
    {name: :presence},
    {region: :belong_to},
    {source: :belong_to},
    {destination: :belong_to},
  ]

  include_examples('model_shared_spec', :route, attributes)

  it 'validates source and destination cannot be the same' do
    region = create(:location)
    expect(build(:route, region: region, source: region, destination: region)).not_to be_valid  
  end

  it 'validates region can only be of location type region' do
    region = create(:location)
    zone = create(:location, location_type: Location::ZONE, parent: region)
    expect(build(:route, region: zone)).not_to be_valid
  end

  it 'validates source is not a region' do
    region = create(:location)
    expect(build(:route, source: region)).not_to be_valid
  end

  it 'validates destination is not a region' do
    region = create(:location)
    expect(build(:route, destination: region)).not_to be_valid
  end
end
