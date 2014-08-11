# == Schema Information
#
# Table name: chili_pepper_sections
#
#  id                 :integer          not null, primary key
#  menu_id            :integer
#  description        :text
#  name               :string(255)
#  position           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  slug               :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

module ChiliPepper
  class Section < ActiveRecord::Base
    belongs_to :menu, class_name: 'ChiliPepper::Menu', touch: true
    validates :menu, :name, presence: true
    has_many :items, class_name: 'ChiliPepper::Item', dependent: :destroy
    acts_as_list scope: :menu
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_attached_file :image,
                      styles: {
                        medium: ChiliPepper.section_medium_image,
                        thumb: '100x100>'
                      }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    def self.position_sorted
      order('position asc')
    end
  end
end
