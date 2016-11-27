# We get information from an xml doc based on the feed's field-path mapping.
class PropertyAttributes

  def initialize(property_field_path_mapping, property_xml_doc={})
    @field_path_mapping = property_field_path_mapping
    @xml_doc            = property_xml_doc
  end

  def attributes
    property_attributes = {}

    @field_path_mapping.each do |field, css|
      next if css.blank?
      property_attributes[field] = @xml_doc.at_css(css)&.text
    end

    property_attributes
  end
end
