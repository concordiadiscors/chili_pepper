# == Schema Information
#
# Table name: chili_pepper_sections
#
#  id                 :integer          not null, primary key
#  menu_id            :integer
#  description        :text
#  name               :string(255)
#  position           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  slug               :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_section, class: 'ChiliPepper::Section' do
	association :menu, factory: :chili_pepper_menu
	description 'Our selection of gorgeous appetizers'
	name 'Appetizers'
	position 1
  image_file_name { 'spec/resources/img_3.jpg' }
  image_content_type { 'image/jpg' }
  image_file_size { 1024 }
  end
end
