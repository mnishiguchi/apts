class CreatePropertyAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :property_amenities do |t|
      t.string :name

      t.timestamps
    end
  end
end
