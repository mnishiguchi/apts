# == Schema Information
#
# Table name: floorplan_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :floorplan_amenity do
    amenity nil
    floorplan nil
  end
end
