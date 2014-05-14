module ChiliPepper
  class Section < ActiveRecord::Base
	belongs_to :menu, class_name: "ChiliPepper::Menu"
	validates :menu, :presence => true
	acts_as_list scope: :menu
  	extend FriendlyId
  friendly_id :name, use: :slugged
  end
end
