# == Schema Information
#
# Table name: field_path_mappings
#
#  id                       :integer          not null, primary key
#  marketing_name           :string
#  website                  :string
#  description              :string
#  contact_phone            :string
#  contact_email            :string
#  location_street          :string
#  location_city            :string
#  location_state           :string
#  location_zip             :string
#  location_latiitude       :string
#  location_longitude       :string
#  floorplan_name           :string
#  floorplan_square_feed    :string
#  floorplan_market_rent    :string
#  floorplan_effective_rent :string
#  floorplan_bedrooms       :string
#  floorplan_bathrooms      :string
#  floorplan_availability   :string
#  file_floorplan           :string
#  file_property            :string
#  amenities_community      :string
#  amenities_floorplan      :string
#  pet_dog                  :string
#  pet_cat                  :string
#  feed_source_id           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require "test_helper"

class FieldPathMappingTest < ActiveSupport::TestCase
  # def field_path_mapping
  #   @field_path_mapping ||= FieldPathMapping.new
  # end
  #
  # def test_valid
  #   assert field_path_mapping.valid?
  # end
end
