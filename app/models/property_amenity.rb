# == Schema Information
#
# Table name: property_amenities
#
#  id          :integer          not null, primary key
#  amenity_id  :integer
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PropertyAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :property
end
