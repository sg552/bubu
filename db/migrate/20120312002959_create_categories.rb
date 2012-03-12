class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_id
      t.text :description

      t.timestamps
    end
  end
end
