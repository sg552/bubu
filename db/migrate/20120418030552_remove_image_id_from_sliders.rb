class RemoveImageIdFromSliders < ActiveRecord::Migration
  def up
    remove_column :sliders, :image_id
    add_column :images, :slider_id, :integer
  end

  def down
    add_column :sliders, :image_id, :integer
    remove_column :images, :slider_id
  end
end
