require 'spec_helper'

module ChiliPepper
  describe Menu do
      it 'has a valid factory' do
        expect(FactoryGirl.create(:chili_pepper_menu)).to  be_valid
      end

      it 'has a name' do
        expect(FactoryGirl.build(:chili_pepper_menu, :name => nil)).not_to be_valid
      end

      it 'should be given a position' do
        chili_pepper_menu = FactoryGirl.create(:chili_pepper_menu, :position => nil)
        expect(chili_pepper_menu.position).not_to be_nil
      end

      it 'is given a slug on creation' do
        chili_pepper_menu = FactoryGirl.create(:chili_pepper_menu)
        expect(chili_pepper_menu.slug).to eq('a-la-carte')
      end
  end
end
