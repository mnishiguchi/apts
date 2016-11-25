# == Schema Information
#
# Table name: property_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe PropertyAmenity do
  let(:property_amenity) { PropertyAmenity.new }

  it "must be valid" do
    value(property_amenity).must_be :valid?
  end
end
