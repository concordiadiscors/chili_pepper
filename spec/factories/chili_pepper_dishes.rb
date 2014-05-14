# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_dish, :class => 'ChiliPepper::Dish' do
    name "Yummy Dish"
    description "Beautiful Appetizer with a sauce made of Chocolate, aniseed spices and soya sauce, all stirred up for your pleasure"
    coeliac 1
    vegetarian false
  end
end
