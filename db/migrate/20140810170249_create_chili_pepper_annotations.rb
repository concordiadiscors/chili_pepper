class CreateChiliPepperAnnotations < ActiveRecord::Migration
  def change
    create_table :chili_pepper_annotations do |t|
      t.integer :menu_id
      t.integer :position
      t.string :description

      t.timestamps
    end
  end
end
