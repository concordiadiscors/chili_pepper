module ChiliPepper
  class Dish < ActiveRecord::Base
    enum :coeliac [:no_coelica_option, :coeliac_friendly, :coeliac_option]
    has_many :items, class_name: 'ChiliPepper::Item', dependent: :destroy
    validates_presence_of :name
  end
end
