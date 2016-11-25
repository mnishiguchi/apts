# == Schema Information
#
# Table name: amenities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Amenity do
  let(:amenity) { Amenity.new }

  it "must be valid" do
    value(amenity).must_be :valid?
  end
end
