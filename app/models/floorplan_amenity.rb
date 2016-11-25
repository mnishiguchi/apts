# == Schema Information
#
# Table name: floorplan_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FloorplanAmenity < ApplicationRecord
  has_many :floorplan_floorplan_amenities
end
