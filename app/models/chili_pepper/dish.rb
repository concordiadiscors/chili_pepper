# == Schema Information
#
# Table name: chili_pepper_dishes
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :string(255)
#  coeliac              :integer
#  created_at           :datetime
#  updated_at           :datetime
#  vegetarian           :boolean
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

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
