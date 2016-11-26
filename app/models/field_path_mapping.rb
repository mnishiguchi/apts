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
#  example_data             :json
#  feed_source_id           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class FieldPathMapping < ApplicationRecord
  attr_accessor :scroll

  # http://apidock.com/rails/ActiveRecord/Persistence/touch
  belongs_to :feed_source, touch: true

  before_update :set_example_data_for_xpath

  def xpath(field)
    send(field)
  end

  def css_path(field)
    send(field)&.gsub("/", " ")
  end

  def all_xpaths
    @xpaths ||= self.feed_source.xpaths
  end

  def all_css_paths
    @css_paths ||= self.all_xpaths.map { |xpath| xpath.gsub("[]", "").gsub("/", " ") }
  end

  def field_attributes
    except = [
      "id",
      "feed_source_id",
      "created_at",
      "updated_at",
      "example_data"
    ]
    attributes.except(*except)
  end

  def example_data_for_field(field)
    example_data_for_xpath(self.send(field))
  end

  def example_data_for_xpath(xpath)
    self.example_data&.fetch(xpath) { "" }
  end

  # Sets to the example_data field a hash of xpaths and example values.
  private def set_example_data_for_xpath
    self.example_data = Hash[
      field_attributes.invert.map do |xpath, _|
        [ xpath, find_example_data_for_xpath(xpath) ]
      end
    ]
  end

  # Returns latest example data for the specified xpath if any.
  private def find_example_data_for_xpath(xpath)
    last_feed_xml = FeedSource.for_url(feed_source.url).feeds.last.raw_xml
    xml_doc       = Nokogiri::XML(last_feed_xml) { |config| config.noerror }

    xpath.present? ? xml_doc.at(xpath).to_s : "" rescue "(error)"
  end
end
