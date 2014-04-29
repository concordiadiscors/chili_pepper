# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_menu, :class => 'ChiliPepper::Menu' do
    name "Early Bird"
    position 1
    description "3 Course Meal"
  end
end
