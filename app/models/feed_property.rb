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

class FeedProperty < ApplicationRecord
  belongs_to :feed
  belongs_to :property
end
