module ChiliPepper
  class Dish < ActiveRecord::Base
    enum coeliac: [ :friendly, :unfriendly, :optional ]
    has_many :items, class_name: 'ChiliPepper::Item', dependent: :destroy
    validates_presence_of :name
  end
end
