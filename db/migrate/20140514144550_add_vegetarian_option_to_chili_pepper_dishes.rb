class AddVegetarianOptionToChiliPepperDishes < ActiveRecord::Migration
  def change
    add_column :chili_pepper_dishes, :vegetarian, :boolean
  end
end
