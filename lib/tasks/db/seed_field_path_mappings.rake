namespace :db do
  desc "Create fake field-path mappings in database"
  task :seed_field_path_mappings => :environment do

    update_field_path_mapping("http://www.example.com/feed-source-1",
      :marketing_name           => "/PhysicalProperty/Property/Identification/MarketingName",
      :description              => "/PhysicalProperty/Property/Identification/WebSite",
      :website                  => "/PhysicalProperty/Property/Information/LongDescription",
      :contact_phone            => "/PhysicalProperty/Property/Identification/Phone/Number",
      :contact_email            => "/PhysicalProperty/Property/Identification/Email",
      :location_street          => "/PhysicalProperty/Property/Identification/Address/Address1",
      :location_city            => "/PhysicalProperty/Property/Identification/Address/City",
      :location_state           => "/PhysicalProperty/Property/Identification/Address/State",
      :location_zip             => "/PhysicalProperty/Property/Identification/Address/Zip",
      :location_latiitude       => "/PhysicalProperty/Property/Identification/Latitude",
      :location_longitude       => "/PhysicalProperty/Property/Identification/Longitude",
      :floorplan_name           => "/PhysicalProperty/Property/Floorplan/Name",
      :floorplan_square_feet    => "/PhysicalProperty/Property/Floorplan/SquareFeet",
      :floorplan_market_rent    => "/PhysicalProperty/Property/Floorplan/MarketRent",
      :floorplan_effective_rent => "",
      :floorplan_bedrooms       => "/PhysicalProperty/Property/Floorplan/Room",
      :floorplan_bathrooms      => "/PhysicalProperty/Property/Floorplan/Room",
      :floorplan_availability   => "",
      :file_floorplan           => "",
      :file_property            => "/PhysicalProperty/Property/File",
      :amenities_community      => "/PhysicalProperty/Property/Amenities/Community",
      :amenities_floorplan      => "/PhysicalProperty/Property/Amenities/Floorplan",
      :pet_dog                  => "/PhysicalProperty/Property/Policy/Pet",
      :pet_cat                  => "/PhysicalProperty/Property/Policy/Pet",
    )
  end
end

def update_field_path_mapping(url, attributes)
  puts "Updating FieldPathMapping for #{url}"
  FeedSource.for_url(url).field_path_mapping.update_attributes(attributes)
end
