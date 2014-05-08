class AddAttributesToMenus < ActiveRecord::Migration
  def change
    add_column :chili_pepper_menus, :slug, :string
    add_index :chili_pepper_menus, :slug, unique: true
    add_column :chili_pepper_menus, :menu_type, :integer
    add_column :chili_pepper_menus, :availability, :string
    add_column :chili_pepper_menus, :price, :decimal, :precision => 5, :scale => 2
  end
end
