# require "test_helper"
#
# class FieldPathMappingsControllerTest < ActionDispatch::IntegrationTest
#   def field_path_mapping
#     @field_path_mapping ||= field_path_mappings :one
#   end
#
#   def test_index
#     get field_path_mappings_url
#     assert_response :success
#   end
#
#   def test_new
#     get new_field_path_mapping_url
#     assert_response :success
#   end
#
#   def test_create
#     assert_difference "FieldPathMapping.count" do
#       post field_path_mappings_url, params: { field_path_mapping: {  } }
#     end
#
#     assert_redirected_to field_path_mapping_path(FieldPathMapping.last)
#   end
#
#   def test_show
#     get field_path_mapping_url(field_path_mapping)
#     assert_response :success
#   end
#
#   def test_edit
#     get edit_field_path_mapping_url(field_path_mapping)
#     assert_response :success
#   end
#
#   def test_update
#     patch field_path_mapping_url(field_path_mapping), params: { field_path_mapping: {  } }
#     assert_redirected_to field_path_mapping_path(field_path_mapping)
#   end
#
#   def test_destroy
#     assert_difference "FieldPathMapping.count", -1  do
#       delete field_path_mapping_url(field_path_mapping)
#     end
#
#     assert_redirected_to field_path_mappings_path
#   end
# end
