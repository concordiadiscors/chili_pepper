class AddHeadingToChiliPepperSections < ActiveRecord::Migration
  def change
    add_column :chili_pepper_sections, :heading, :string
  end
end
