module ChiliPepper
  class Menu < ActiveRecord::Base
  	validates_presence_of :name
  	enum menu_type: [:food, :drinks]
  	acts_as_list
  	has_many :sections, class_name: "ChiliPepper::Section", dependent: :destroy
  	extend FriendlyId
  friendly_id :name, use: :slugged
  end
end
