# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_item, class: 'ChiliPepper::Item' do
    association :section, factory: :chili_pepper_section, id: 1
    association :dish, factory: :chili_pepper_dish, id: 1
    position 1
    price 12.5
    column 1
  end
end
