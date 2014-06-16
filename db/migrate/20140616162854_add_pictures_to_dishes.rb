class AddPicturesToDishes < ActiveRecord::Migration
  def change
    add_attachment :chili_pepper_dishes, :picture
  end
end
