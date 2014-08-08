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
