module ChiliPepper
  class Dish < ActiveRecord::Base
    enum coeliac: [:coeliac_friendly, :not_coeliac_friendly, :coeliac_option_available]
    has_many :items, class_name: 'ChiliPepper::Item', dependent: :destroy
    accepts_nested_attributes_for :items, :allow_destroy => true
    has_many :sections, :through => :items
    validates_presence_of :name
    has_attached_file :picture, :styles => { :medium => "1200x720>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  end
end
