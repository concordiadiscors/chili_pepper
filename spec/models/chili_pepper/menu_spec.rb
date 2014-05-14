require 'spec_helper'

module ChiliPepper
  describe Menu do
      it 'has a valid factory' do
        FactoryGirl.create(:chili_pepper_menu).should be_valid
      end

      it 'has a name' do
        FactoryGirl.build(:chili_pepper_menu, :name => nil).should_not be_valid
      end

      it 'should be given a position' do
        chili_pepper_section = FactoryGirl.create(:chili_pepper_section, :position => nil)
        chili_pepper_section.position.should_not be_nil
      end

      it 'is given a slug on creation' do
        chili_pepper_section = FactoryGirl.create(:chili_pepper_section)
        chili_pepper_section.slug.should == 'appetizers'
      end
  end
end
