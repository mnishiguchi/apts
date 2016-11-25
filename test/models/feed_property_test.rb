# == Schema Information
#
# Table name: feed_properties
#
#  id          :integer          not null, primary key
#  feed_id     :integer
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

describe FeedProperty do
  let(:feed_property) { FeedProperty.new }

  it "must be valid" do
    value(feed_property).must_be :valid?
  end
end
