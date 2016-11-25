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

FactoryGirl.define do
  factory :property do
    marketing_name "MyString"
    website "MyString"
    description "MyText"
    contact_email "MyString"
    contact_phone "MyString"
    location_street "MyString"
    location_city "MyString"
    location_state "MyString"
    location_zip "MyString"
    location_latitude 1.5
    location_longitude 1.5
    pet_dog false
    pet_cat false
    floorplan nil
    amenity nil
  end
end
