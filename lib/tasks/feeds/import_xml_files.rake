require 'open-uri'

namespace :feeds do
  desc "Import feed data from xml files in `db/files/`"
  task :import_xml_files do

    # Get file paths.
    paths = Dir.glob(Rails.root.join("db", "files", "*.xml"))

    # Read feed files.
    feeds = paths.map do |path|
      open(path) { |io| io.read }
    end

    # Convert it to a hash.
    feed_hashes = feeds.map do |feed|
      Hash.from_xml(feed)
    end

    # Write it to files.
    feed_hashes.each_with_index do |feed_hash, i|
      path = Rails.root.join("db", "files", "hash_#{i}.rb")
      File.write(path, feed_hash)
    end
  end
end
