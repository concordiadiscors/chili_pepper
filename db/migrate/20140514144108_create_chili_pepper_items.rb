class CreateChiliPepperItems < ActiveRecord::Migration
  def change
    create_table :chili_pepper_items do |t|
      t.integer :section_id
      t.integer :dish_id
      t.integer :position
      t.decimal :price, precision: 5, scale: 2
      t.integer :column

      t.timestamps
    end
  end
end
