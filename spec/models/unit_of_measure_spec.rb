require 'rails_helper'

RSpec.describe UnitOfMeasure, type: :model do
  attributes = [
    {name: :presence},
    {abbreviation: :presence},
    {unit_type: :presence}
  ]

  include_examples('model_shared_spec', :unit_of_measure, attributes)

  it { is_expected.to(validate_inclusion_of(:unit_type).in_array(UnitOfMeasure::UNIT_TYPES)) }
end
