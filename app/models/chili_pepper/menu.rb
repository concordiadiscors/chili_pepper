module ChiliPepper
  class Menu < ActiveRecord::Base
  	validates_presence_of :name
  	enum menu_type: [:food, :drinks]
  	acts_as_list
  	has_many :sections, class_name: "ChiliPepper::Section", dependent: :destroy
  	extend FriendlyId
  friendly_id :name, use: :slugged
  has_attached_file :image, :styles => { :medium => "1200x720>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  end
end
