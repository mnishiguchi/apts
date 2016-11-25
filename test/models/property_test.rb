# == Schema Information
#
# Table name: properties
#
#  id                 :integer          not null, primary key
#  marketing_name     :string
#  website            :string
#  description        :text
#  contact_email      :string
#  contact_phone      :string
#  location_street    :string
#  location_city      :string
#  location_state     :string
#  location_zip       :string
#  location_latitude  :float
#  location_longitude :float
#  pet_dog            :boolean
#  pet_cat            :boolean
#  feed_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require "test_helper"

describe Property do
  let(:property) { Property.new }

  it "must be valid" do
    value(property).must_be :valid?
  end
end
