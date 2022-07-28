require 'rails_helper'

RSpec.describe "Transporters", type: :request do
  include_examples('request_shared_spec', 'transporters', 7)

  let(:valid_attributes) do 
    { 
      code: Faker::Code.npi,
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      contact_phone: Faker::PhoneNumber.cell_phone_in_e164
    }
  end 

  let(:invalid_attributes) do 
    { 
      code: nil,
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      contact_phone: Faker::PhoneNumber.cell_phone_in_e164
    }
  end 

  let(:new_attributes) do
    {
      name: Faker::Name.name
    }
  end
end
