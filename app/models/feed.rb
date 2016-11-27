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

      property_attributes = property_attributes(property_xml_doc)
      next if property_attributes.blank?
      next if property_attributes.fetch("marketing_name", nil).blank?

      floorplan_xml_docs = floorplan_xml_docs(property_xml_doc)
      create_property_with_floorplans(property_attributes, floorplan_xml_docs)
    end
  end

  private def create_property_with_floorplans(property_attributes, floorplan_xml_docs)

    property = self.properties.create!(property_attributes)

    floorplan_xml_docs.each do |floorplan_xml_doc|

      # TODO: Floorplan parser
      #
      attributes = floorplan_attributes(floorplan_xml_doc)


      ap attributes


      property.floorplans.create!(attributes)
    end
  end

  private def property_attributes(property_xml_doc)
    property_attributes = {}

    self.field_path_mapping.for_property.each do |field, css|
      next if css.blank?
      property_attributes[field] = property_xml_doc.at_css(css)&.text
    end

    property_attributes
  end

  private def floorplan_attributes(floorplan_xml_doc)
    floorplan_attributes = {}

    self.field_path_mapping.for_floorplan.each do |field, css|
      next if css.blank?
      floorplan_attributes[field] = floorplan_xml_doc.at_css(css)&.text
    end

    floorplan_attributes
  end

  # Returns an array of nokogiri properties.
  private def property_xml_docs
    Nokogiri::XML(raw_xml).xpath("PhysicalProperty/Property")
  end

  # Returns an array of nokogiri floorplans.
  private def floorplan_xml_docs(property_xml_doc)
    property_xml_doc.xpath("Floorplan")
  end
end
