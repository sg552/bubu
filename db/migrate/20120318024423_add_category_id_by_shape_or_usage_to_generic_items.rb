class AddCategoryIdByShapeOrUsageToGenericItems < ActiveRecord::Migration
  def change
    remove_column :generic_items, :category_id
    add_column :generic_items, :category_id_by_usage, :integer
    add_column :generic_items, :category_id_by_shape, :integer
    add_column :generic_items, :category_id_by_age, :integer
  end
end
