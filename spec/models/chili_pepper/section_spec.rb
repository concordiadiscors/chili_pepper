require 'spec_helper'

module ChiliPepper
  describe Section do
    it 'has a valid factory' do
      FactoryGirl.create(:chili_pepper_section).should be_valid
    end

    it 'belongs to a valid menu' do
    	FactoryGirl.build(:chili_pepper_section, menu_id: 3).should_not be_valid
    end
  end
end
