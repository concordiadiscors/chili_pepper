# == Schema Information
#
# Table name: chili_pepper_menus
#
#  id                            :integer          not null, primary key
#  name                          :string(255)
#  position                      :integer
#  description                   :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#  slug                          :string(255)
#  menu_type                     :integer
#  availability                  :string(255)
#  price                         :decimal(5, 2)
#  published                     :boolean
#  downloadable_pdf_file_name    :string(255)
#  downloadable_pdf_content_type :string(255)
#  downloadable_pdf_file_size    :integer
#  downloadable_pdf_updated_at   :datetime
#  image_file_name               :string(255)
#  image_content_type            :string(255)
#  image_file_size               :integer
#  image_updated_at              :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_menu, :class => 'ChiliPepper::Menu' do
    name "A La Carte"
    position 1
    description "3 Course Meal"
    image_file_name { 'spec/resources/img_2.jpg' }
    image_content_type { 'image/jpg' }
    image_file_size { 1024 }
    downloadable_pdf_file_name { 'spec/resources/menu_2.pdf' }
    downloadable_pdf_content_type { 'application/pdf' }
    downloadable_pdf_file_size { 1024 }
  end

  factory :menu_with_price, :class => 'ChiliPepper::Menu' do
  	name "Early Bird"
  	position 2
  	description "3 Course Meal"
  	price 15
  end
end
