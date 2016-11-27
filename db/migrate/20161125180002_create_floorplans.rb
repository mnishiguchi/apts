class CreateFloorplans < ActiveRecord::Migration[5.0]
  def change
    create_table :floorplans do |t|
      t.string :name
      t.integer :square_feet
      t.integer :market_rent
      t.integer :effective_rent
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :availability
      t.references :property, index: true

      t.timestamps
    end
  end
end
