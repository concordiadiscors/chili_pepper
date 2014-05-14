require 'spec_helper'

module ChiliPepper
  describe Item do
  it 'has a valid factory' do
    FactoryGirl.build(:chili_pepper_item).should be_valid
  end

    it 'belongs to a valid section' do
      FactoryGirl.build(:chili_pepper_item, section_id: 3).should_not be_valid
  end

  it 'belongs to a valid dish' do
    FactoryGirl.build(:chili_pepper_item, dish_id: 3).should_not be_valid
    end

      it 'should be given a position' do
        chili_pepper_item = FactoryGirl.create(:chili_pepper_item, :position => nil)
        chili_pepper_item.position.should_not be_nil
      end
  end
end
