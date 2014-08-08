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

require 'spec_helper'

module ChiliPepper
  describe Dish do
  	it 'has a valid factory' do
  	  FactoryGirl.build(:chili_pepper_dish).should be_valid
  	end

  	it 'has a name' do
  		FactoryGirl.build(:chili_pepper_dish, name: nil).should_not be_valid
  	end
  end
end
