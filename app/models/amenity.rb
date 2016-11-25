# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Amenity < ApplicationRecord
  has_many :property_amenities, dependent: :destroy
  has_many :floorplan_amenities, dependent: :destroy
end
