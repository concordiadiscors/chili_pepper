# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_menu, :class => 'ChiliPepper::Menu' do
    name "A La Carte"
    position 1
    description "3 Course Meal"
  end

  factory :menu_with_price, :class => 'ChiliPepper::Menu' do
  	name "Early Bird"
  	position 2
  	description "3 Course Meal"
  	price 15
  end
end
