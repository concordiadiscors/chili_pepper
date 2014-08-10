class AddAnnotationIdToItems < ActiveRecord::Migration
  def change
    add_column :chili_pepper_items, :annotation_id, :integer
  end
end
