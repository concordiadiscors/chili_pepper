class AddAttachmentsToSections < ActiveRecord::Migration
  def change
    add_attachment :chili_pepper_sections, :image
  end
end
