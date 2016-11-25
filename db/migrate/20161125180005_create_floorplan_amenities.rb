class CreateFloorplanAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplan_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :floorplan, foreign_key: true

      t.timestamps
    end
  end
end
