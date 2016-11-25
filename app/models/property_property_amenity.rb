# == Schema Information
#
# Table name: property_property_amenities
#
#  id                  :integer          not null, primary key
#  property_id         :integer
#  property_amenity_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PropertyPropertyAmenity < ApplicationRecord
  belongs_to :property
  belongs_to :property_amenity

  validates :name, presence: true, uniqueness: true
end
