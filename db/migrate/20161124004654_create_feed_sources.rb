class CreateFeedSources < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_sources do |t|
      t.string :url,                 null: false
      t.string :xpaths, array: true
      t.json :field_path_mapping

      t.timestamps
    end
  end
end
