class AddPrincipleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :principle, :string

  end
end
