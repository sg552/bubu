class RemoveChildAgeScopeFromGenericItems < ActiveRecord::Migration
  def up
    remove_column :generic_items, :child_age_scope
  end

  def down
    add_column :generic_items, :child_age_scope, :string
  end
end
