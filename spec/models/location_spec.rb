require 'rails_helper'

RSpec.describe Location, type: :model do
  attributes = [
    { code: %i[presence uniqueness] },
    { name: :presence },
    { location_type: :presence },
  ]

  include_examples('model_shared_spec', :location, attributes)

  it { is_expected.to(validate_inclusion_of(:location_type).in_array(Location::LOCATION_TYPES)) }

  it 'validates parent is nil for region' do
    parent = create(:location)
    location = build(:location, parent: parent)
    
    expect(location).not_to be_valid
    errors = location.errors.full_messages[0]
    expect(errors).to eq 'Location cannot have Region as parent.'  
  end

  it 'validates location type of a parent' do
    region = create(:location)
    zone = create(:location, location_type: Location::ZONE, parent: region)
    expect(build(:location, parent: zone)).not_to be_valid
  end

end
