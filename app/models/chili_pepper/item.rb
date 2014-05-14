module ChiliPepper
  class Item < ActiveRecord::Base
    belongs_to :dish, class_name: 'ChiliPepper::Dish'
    validates :dish, presence: true
    belongs_to :section, class_name: 'ChiliPepper::Section'
    validates :section, presence: true
    acts_as_list scope: :section
  end
end
