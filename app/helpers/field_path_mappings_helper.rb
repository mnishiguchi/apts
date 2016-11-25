module FieldPathMappingsHelper

  # A wrapper of the simpleform's select tag that has options of xpaths.
  # It finds and shows an example value of the selected xpath.
  # NOTE: Although xpaths are saved in database, we use css-paths here because
  # css-paths are easier on the eyes.
  def field_path_mapping_select_tag(f, name)
    option_array = @field_path_mapping.feed_source.xpaths.map do |xpath|
      # Convert xpaths into css-paths.
      xpath.gsub("[]", "").gsub("/", " ")
    end.select(&:presence)

    selected_xpath = @field_path_mapping.send(name).gsub("/", " ")
    hint = @field_path_mapping.example_data_for_xpath(selected_xpath)

    f.input name, collection: option_array,
                  selected:   selected_xpath,
                  hint:       hint,
                  include_blank: "(select if none)"

  end
end
