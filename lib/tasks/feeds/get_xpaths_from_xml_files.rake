require 'open-uri'
require 'nokogiri'

namespace :feeds do
  desc "Get xpaths from xml files in `db/files/`"
  task :get_xpaths_from_xml_files do

    # Get file paths.
    paths = Dir.glob(Rails.root.join("db", "files", "*.xml"))

    # Read feed files.
    feeds = paths.map do |path|
      open(path) { |io| io.read }
    end

    # Parse feeds using Nokogiri.
    parsed_xml_documents = feeds.map do |feed|
      Nokogiri.XML(feed)
    end

    # Write it to files.
    parsed_xml_documents.each_with_index do |parsed_doc, i|
      path = Rails.root.join("db", "files", "xpath_#{i}.rb")
      xpaths = uniq_xpaths(parsed_doc).join("\n")
      File.write(path, xpaths)
    end
  end
end

def uniq_xpaths(parsed_doc)
  xpaths = []
  parsed_doc.xpath('//*[child::* and not(child::*/*)]').each do |node|
    xpaths << node.path
  end
  xpaths.each { |path| path.gsub!(/\[\d*\]/, "[]") }.uniq!
end
