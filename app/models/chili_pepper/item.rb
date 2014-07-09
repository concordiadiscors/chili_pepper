module ChiliPepper
  class Item < ActiveRecord::Base
    belongs_to :dish, class_name: 'ChiliPepper::Dish'
    belongs_to :section, class_name: 'ChiliPepper::Section'
    validates :section, presence: true
    acts_as_list scope: :section
    after_destroy :check_dish_relevance

    private
  
    def check_dish_relevance
        if dish.items.count == 0
        dish.destroy
        end
    end
    
  end
end
