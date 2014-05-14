class AddPublishedStatusToMenus < ActiveRecord::Migration
  def change
    add_column :chili_pepper_menus, :published, :boolean
  end
end
