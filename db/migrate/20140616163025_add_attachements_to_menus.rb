class AddAttachementsToMenus < ActiveRecord::Migration
  def change
    add_attachment :chili_pepper_menus, :downloadable_pdf
    add_attachment :chili_pepper_menus, :image
  end
end
