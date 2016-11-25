class CreateFloorplanAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplan_amenities do |t|
      t.string :name

      t.timestamps
    end
  end
end
