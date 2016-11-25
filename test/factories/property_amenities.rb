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

FactoryGirl.define do
  factory :property_amenity do
    amenity nil
    property nil
  end
end
