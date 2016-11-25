# == Schema Information
#
# Table name: floorplan_floorplan_amenities
#
#  id                   :integer          not null, primary key
#  floorplan_id         :integer
#  floorplan_amenity_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class FloorplanFloorplanAmenity < ApplicationRecord
  belongs_to :floorplan
  belongs_to :floorplan_amenity

  validates :name, presence: true, uniqueness: true
end
