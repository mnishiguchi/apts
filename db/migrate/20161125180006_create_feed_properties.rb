class CreateFeedProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_properties do |t|
      t.references :feed, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
