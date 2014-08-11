# == Schema Information
#
# Table name: chili_pepper_items
#
#  id         :integer          not null, primary key
#  section_id :integer
#  dish_id    :integer
#  position   :integer
#  price      :decimal(5, 2)
#  column     :integer
#  created_at :datetime
#  updated_at :datetime
#

module ChiliPepper
  class Item < ActiveRecord::Base
    belongs_to :dish, class_name: 'ChiliPepper::Dish'
    belongs_to :section, class_name: 'ChiliPepper::Section', touch: true
    belongs_to :annotation, class_name: 'ChiliPepper::Annotation'
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
