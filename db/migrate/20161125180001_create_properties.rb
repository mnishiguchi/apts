class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :marketing_name
      t.string :website
      t.text :description
      t.string :contact_email
      t.string :contact_phone
      t.string :location_street
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.float :location_latitude
      t.float :location_longitude
      t.boolean :pet_dog
      t.boolean :pet_cat

      t.timestamps
    end
  end
end
