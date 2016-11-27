# == Schema Information
#
# Table name: feeds
#
#  id             :integer          not null, primary key
#  raw_xml        :text             not null
#  xpaths         :string           not null, is an Array
#  feed_source_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Feed < ApplicationRecord
  belongs_to :feed_source

  has_one :field_path_mapping, through: :feed_source

  has_many :properties

  validates :raw_xml, uniqueness: true

  def create_properties
    property_xml_docs.each do |property_xml_doc|
      property_attributes = {}

      field_path_mapping.field_attributes_for_property.each do |field, css|
        next if css.blank?
        property_attributes[field] = property_xml_doc.at_css(css)&.text
      end

      properties.create!(property_attributes)
    end
  end

  # Returns an array of nokogiri properties.
  private def property_xml_docs
    Nokogiri::XML(raw_xml).xpath("PhysicalProperty/Property")
  end
end
