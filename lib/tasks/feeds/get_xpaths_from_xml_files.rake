require 'open-uri'
require 'nokogiri'

namespace :feeds do
  desc "Get xpaths from xml files in `db/files/`"
  task :get_xpaths_from_xml_files do

    # Get file paths.
    file_paths = Dir.glob(Rails.root.join("db", "files", "*.xml"))

    # Read xml files and parse them using Nokogiri.
    # http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#from_a_file
    parsed_xml_documents = file_paths.map do |file_path|
      Nokogiri::XML(File.open(file_path))
    end

    # For each document, get all the xpaths and ouput them to a file.
    parsed_xml_documents.each_with_index do |parsed_doc, i|
      file_path = Rails.root.join("db", "files", "xpath_#{i}.rb")
      xpaths    = all_xpaths(parsed_doc).join("\n")
      File.write(file_path, xpaths)
    end
  end
end

# Generates an array of all the xpath from a Nokogiri-parsed document.
# Duplicate xpaths will be removed and array indices will be replaced with `[]`.
# http://stackoverflow.com/a/15692699/3837223
def all_xpaths(parsed_doc)
  xpaths = parsed_doc.xpath('//*').map do |node|
    node.path.gsub(/\[\d*\]/, "[]")
  end.uniq
end
