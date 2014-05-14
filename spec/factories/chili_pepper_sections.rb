# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_section, class: 'ChiliPepper::Section' do
	association :menu, factory: :chili_pepper_menu, id: 1
	description 'Our selection of gorgeous appetizers'
	name 'Appetizers'
	position 1
  end
end
