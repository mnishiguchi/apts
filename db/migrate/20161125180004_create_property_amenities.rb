class CreatePropertyAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :property_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
