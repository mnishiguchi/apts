class CreateFieldPathMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :field_path_mappings do |t|
      t.string :location_address_1
      t.string :location_address_2
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :location_latiitude
      t.string :location_longitude
      t.string :marketing_name
      t.string :contact_phone
      t.string :contact_email
      t.string :website
      t.string :description
      t.string :floorplan_name
      t.string :floorplan_square_feed
      t.string :floorplan_market_rent
      t.string :floorplan_effective_rent
      t.string :floorplan_bedroops
      t.string :floorplan_bathrooms
      t.string :floorplan_availability
      t.string :file_floorplan
      t.string :file_property
      t.string :amenities_community
      t.string :amenities_floorplan
      t.string :pet_dog
      t.string :pet_cat
      t.references :feed_source, foreign_key: true

      t.timestamps
    end
  end
end
