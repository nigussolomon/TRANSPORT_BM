require 'rails_helper'

RSpec.describe Transporter, type: :model do
  attributes = [
    { code: %i[presence uniqueness] },
    { name: :presence },
    { address: :presence },
    { contact_phone: :presence }
  ]

  include_examples('model_shared_spec', :transporter, attributes)
end
