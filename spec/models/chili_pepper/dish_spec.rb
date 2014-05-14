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
