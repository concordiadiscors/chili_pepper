class CreateChiliPepperSections < ActiveRecord::Migration
  def change
    create_table :chili_pepper_sections do |t|
      t.integer :menu_id
      t.text :description
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
