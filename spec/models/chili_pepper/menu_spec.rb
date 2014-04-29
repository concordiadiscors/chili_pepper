require 'spec_helper'

module ChiliPepper
  describe Menu do
      it "has a valid factory" do
        FactoryGirl.create(:chili_pepper_menu).should be_valid
      end
      
      it "should have a name" do
        FactoryGirl.build(:chili_pepper_menu, :name => nil).should_not be_valid
      end
      
      it "should be given a position" do
        chili_pepper_menu = FactoryGirl.create(:chili_pepper_menu, :position => nil)
        chili_pepper_menu.position.should_not be_nil
      end
  end
end