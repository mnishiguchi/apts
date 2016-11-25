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
#  floorplan_square_feet    :string
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

class FieldPathMapping < ApplicationRecord
  belongs_to :feed_source

  # Returns latest example data for the specified xpath if any.
  def example_data_for_xpath(xpath)
    last_feed = FeedSource.for_url(feed_source.url).feeds.last
    xml_doc   = Nokogiri::XML(last_feed.raw_xml) { |config| config.noerror }

    xpath.present? ? xml_doc.at(xpath).to_s : "" rescue "(error)"
  end
end
