class CreateChiliPepperDishes < ActiveRecord::Migration
  def change
    create_table :chili_pepper_dishes do |t|
      t.string :name
      t.string :description, limit: 255
      t.integer :coeliac

      t.timestamps
    end
  end
end
