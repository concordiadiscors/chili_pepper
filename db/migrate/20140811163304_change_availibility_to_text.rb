class ChangeAvailibilityToText < ActiveRecord::Migration
  def up
      change_column :chili_pepper_menus, :availability, :text
    end

    def down
      change_column :chili_pepper_menus, :availability, :string
    end
end
