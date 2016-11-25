class CreateFloorplanFloorplanAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplan_floorplan_amenities do |t|
      t.references :floorplan, foreign_key: true
      t.references :floorplan_amenity, foreign_key: true

      t.timestamps
    end
  end
end
