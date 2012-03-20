class RenameDescriptionToTipsOnCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :description, :tip
  end
end
