# == Schema Information
#
# Table name: chili_pepper_dishes
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :string(255)
#  coeliac              :integer
#  created_at           :datetime
#  updated_at           :datetime
#  vegetarian           :boolean
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_dish, class: 'ChiliPepper::Dish' do
    name 'Yummy Dish'
    description 'Beautiful Appetizer with a sauce made of Chocolate, aniseed spices and soya sauce, all stirred up for your pleasure'
    coeliac 1
    vegetarian false
    picture_file_name { 'spec/resources/img_1.jpg' }
    picture_content_type { 'image/jpg' }
    picture_file_size { 1024 }
  end
end
