class Location < ApplicationRecord
    REGION = 'Region'.freeze
    ZONE = 'Zone'.freeze
    WOREDA = 'Woreda'.freeze
    FDP = 'Fdp'.freeze
    HUB = 'Hub'.freeze
    WAREHOUSE = 'Warehouse'.freeze

    LOCATION_TYPES = [REGION, ZONE, WOREDA, FDP, HUB, WAREHOUSE].freeze

    has_ancestry

    validates :code, :name, :location_type, presence: true
    validates :code, uniqueness: true 
    validates :location_type, inclusion: {:in => LOCATION_TYPES} 
    validate :ancestry_validation 


    def ancestry_validation
        parents = {
            REGION => [],
            ZONE => [REGION],
            WOREDA => [REGION, ZONE],
            FDP => [REGION, ZONE, WOREDA],
            HUB => [REGION, ZONE, WOREDA, FDP],
            WAREHOUSE => [REGION, ZONE, WOREDA, FDP, HUB]
          }


        return if location_type.nil? || location_type.empty?
        
        return if location_type == Location::REGION && parent.nil?

        errors.add(:location, 'parent cannot be empty.') if location_type != Location::REGION && parent.nil?

        return unless parent

        return if parents[location_type].include?(parent.location_type)

        errors.add(:location, "cannot have #{parent.location_type} as parent.")
    
    end
end
