# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_item, class: 'ChiliPepper::Item' do
    association :section, factory: :chili_pepper_section
    association :dish, factory: :chili_pepper_dish
    sequence(:position) {|n| n}
    price 12.5
    column 1
  end
end
