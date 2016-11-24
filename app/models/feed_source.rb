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

class FeedSource < ApplicationRecord
  has_many :feeds

  before_save :set_xpaths

  def self.for_url(url)
    self.where(url: url).first_or_create!
  end

  def import_feed
    xml_doc = self.import_xml_from_url
    self.feeds.create(
      raw_xml: xml_doc,
      xpaths:  self.all_xpaths(xml_doc)
    )
  end

  def import_xml_from_url
    # http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#from_the_internets
    Nokogiri::XML(open(url))
  end

  # Generates an array of all the xpath from a Nokogiri-parsed document.
  # Duplicate xpaths will be removed and array indices will be replaced with `[]`.
  def all_xpaths(xml_doc)
    # http://stackoverflow.com/a/15692699/3837223
    xpaths = xml_doc.xpath('//*').map do |node|
      node.path.gsub(/\[\d*\]/, "[]")
    end.uniq
  end

  # Set the xpaths of this feed source.
  private def set_xpaths
    # http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#from_the_internets
    self.xpaths = self.all_xpaths(self.import_xml_from_url)
  end
end
