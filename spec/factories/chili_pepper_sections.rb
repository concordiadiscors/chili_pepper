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
