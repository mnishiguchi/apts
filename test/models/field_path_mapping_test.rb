require "test_helper"

class FieldPathMappingTest < ActiveSupport::TestCase
  def field_path_mapping
    @field_path_mapping ||= FieldPathMapping.new
  end

  def test_valid
    assert field_path_mapping.valid?
  end
end
