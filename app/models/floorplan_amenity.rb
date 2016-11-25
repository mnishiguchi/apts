# == Schema Information
#
# Table name: floorplan_amenities
#
#  id           :integer          not null, primary key
#  amenity_id   :integer
#  floorplan_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FloorplanAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :floorplan
end
