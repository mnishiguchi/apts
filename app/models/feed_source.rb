# == Schema Information
#
# Table name: feed_sources
#
#  id                 :integer          not null, primary key
#  url                :string           not null
#  xpaths             :string           is an Array
#  field_path_mapping :json
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# https://ruby-doc.org/stdlib-2.3.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'

class FeedSource < ApplicationRecord
  has_many :feeds

  after_save :set_xpaths

  def self.for_url(url)
    self.first_or_create!(url: url)
  end

  private def set_xpaths
    # http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#from_the_internets
    parsed_doc = Nokogiri::XML(open(url))
    self.xpath = all_xpaths(parsed_doc)
  end

  # Generates an array of all the xpath from a Nokogiri-parsed document.
  # Duplicate xpaths will be removed and array indices will be replaced with `[]`.
  # http://stackoverflow.com/a/15692699/3837223
  private def all_xpaths(parsed_doc)
    xpaths = parsed_doc.xpath('//*').map do |node|
      node.path.gsub(/\[\d*\]/, "[]")
    end.uniq
  end
end
