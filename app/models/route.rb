class Route < ApplicationRecord
  belongs_to :region, class_name: 'Location'
  belongs_to :source, class_name: 'Location'
  belongs_to :destination, class_name: 'Location'

  validates :name, presence: true
  validate :validate_region, :validate_source, :validate_destination, :validate_route

  def validate_region
    return unless region
    return if region.location_type == Location::REGION
    
    errors.add(:route, 'region should be a valid region') unless region.location_type == Location::REGION
  end
    
  def validate_source
    return unless source
    return if source.location_type != Location::REGION
    
    errors.add(:route, 'source cannot be a region') if source.location_type == Location::REGION
  end

  def validate_destination
    return unless destination
    return if destination.location_type != Location::REGION
    
    errors.add(:route, 'source cannot be a region') if destination.location_type == Location::REGION
  end

  def validate_route
    return unless source
    return unless destination
    
    return if source != destination

    errors.add(:route, 'source and destination cannot be the same') if source == destination
  end
end
