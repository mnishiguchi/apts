# == Schema Information
#
# Table name: properties
#
#  id                 :integer          not null, primary key
#  marketing_name     :string
#  website            :string
#  description        :text
#  contact_email      :string
#  contact_phone      :string
#  location_street    :string
#  location_city      :string
#  location_state     :string
#  location_zip       :string
#  location_latitude  :float
#  location_longitude :float
#  pet_dog            :boolean
#  pet_cat            :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Property < ApplicationRecord

  has_one :feed_property, dependent: :destroy
  has_one :feed, through: :feed_property

  has_many :floorplans

  has_many :property_amenities, dependent: :destroy
  has_many :amenities, through: :property_amenities
end
