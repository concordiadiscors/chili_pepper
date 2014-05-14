class AddSlugToChiliPepperSections < ActiveRecord::Migration
  def change
    add_column :chili_pepper_sections, :slug, :string
    add_index :chili_pepper_sections, :slug, unique: true
  end
end
