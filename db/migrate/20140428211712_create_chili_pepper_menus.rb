class CreateChiliPepperMenus < ActiveRecord::Migration
  def change
    create_table :chili_pepper_menus do |t|
      t.string :name
      t.integer :position
      t.string :description

      t.timestamps
    end
  end
end
