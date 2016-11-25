# == Schema Information
#
# Table name: floorplan_amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe FloorplanAmenity do
  let(:floorplan_amenity) { FloorplanAmenity.new }

  it "must be valid" do
    value(floorplan_amenity).must_be :valid?
  end
end
