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

      case field
      when "pet_cat", "pet_dog", "amenities"
        property_attributes[field] = send(field, css)
      else
        property_attributes[field] = @xml_doc.at_css(css)&.text
      end
    end

    property_attributes
  end


  # ---
  # Parsers corresponding to all the individual attribute names.
  # + The method name must match the attribute name.
  # + Takes in a css path.
  # + Returns a value for the attribute.
  # ---


  private def amenities(css)
    # @xml_doc.css(css).map { |node| Hash.from_xml(node.to_s) }

    # Amenity hashes
    amenity_hashes = @xml_doc.css(css).map do |node|
      Hash.from_xml(node.to_s)[css.strip]
    end.compact

    # Find values for the keys Community and Floorplan
    community = {}
    floorplan = {}
    amenity_hashes.each do |amenity_hash|
      community = amenity_hash&.fetch("Community") { nil }
      floorplan = amenity_hash&.fetch("Floorplan") { nil }
    end

    if community.present? && floorplan.present?
      {
        community: community,
        floorplan: floorplan,
      }
    elsif amenity_hashes&.map do |hash| hash.keys end.flatten
      # TODO
      {
        hello: amenity_hashes
      }
    end
  end

  private def pet_cat(css)
    pet(css, /cat/i)
  end

  private def pet_dog(css)
    pet(css, /dog/i)
  end

  private def pet(css, pet_type_regex)
    # 1. Check the text node.
    text = @xml_doc.at(css)&.text
    return text if text =~ pet_type_regex

    # 2. Check the children.
    hashes = @xml_doc.css(css).map { |node| node.to_h }
    hashes.each do |hash|
      return hash if hash.to_s =~ pet_type_regex
    end

    nil
  end
end
