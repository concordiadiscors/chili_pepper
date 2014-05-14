module ChiliPepper
  class Section < ActiveRecord::Base
	belongs_to :menu, class_name: "ChiliPepper::Menu"
	validates :menu, :name, presence: true
	has_many :items, class_name: "ChiliPepper::Item", dependent: :destroy
	acts_as_list scope: :menu
  	extend FriendlyId
  friendly_id :name, use: :slugged
  end
end
