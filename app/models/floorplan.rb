# == Schema Information
#
# Table name: floorplans
#
#  id             :integer          not null, primary key
#  name           :string
#  square_feet    :integer
#  market_rent    :integer
#  effective_rent :integer
#  bedrooms       :integer
#  bathrooms      :integer
#  availability   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Floorplan < ApplicationRecord
  has_many :floorplan_floorplan_amenities, dependent: :destroy
  has_many :floorplan_amenities, through: :floorplan_floorplan_amenities

  # TODO: enum: bedrooms, bathrooms, availability
end
