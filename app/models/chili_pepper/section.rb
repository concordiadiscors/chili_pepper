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
	belongs_to :menu, class_name: "ChiliPepper::Menu"
	validates :menu, :name, presence: true
	has_many :items, class_name: "ChiliPepper::Item", dependent: :destroy
	acts_as_list scope: :menu
  	extend FriendlyId
  friendly_id :name, use: :slugged
    has_attached_file :image, :styles => { :medium => "1200x720>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  end
end
