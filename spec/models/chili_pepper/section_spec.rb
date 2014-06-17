require 'spec_helper'

module ChiliPepper
  describe Section do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:chili_pepper_section)).to be_valid
    end

    it 'has a name' do
    	expect(FactoryGirl.build(:chili_pepper_section, name: nil)).not_to be_valid
    end

    it 'belongs to a valid menu' do
    	expect(FactoryGirl.build(:chili_pepper_section, menu_id: 3)).not_to be_valid
    end

    it 'should be given a position' do
      chili_pepper_section = FactoryGirl.create(:chili_pepper_section, :position => nil)
      expect(chili_pepper_section.position).not_to be_nil
    end

    it 'is given a slug on creation' do
      chili_pepper_section = FactoryGirl.create(:chili_pepper_section)
      expect(chili_pepper_section.slug).to eq('appetizers')
    end

  end
end
