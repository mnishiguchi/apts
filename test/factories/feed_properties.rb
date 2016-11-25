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

FactoryGirl.define do
  factory :feed_property do
    feed nil
    property nil
  end
end
