module ChiliPepper
  class Dish < ActiveRecord::Base
    enum coeliac: [ :friendly, :unfriendly, :optional ]
    has_many :items, class_name: 'ChiliPepper::Item', dependent: :destroy
    validates_presence_of :name
    has_attached_file :picture, :styles => { :medium => "1200x720>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  end
end
