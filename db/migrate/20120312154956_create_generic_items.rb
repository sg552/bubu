class CreateGenericItems < ActiveRecord::Migration
  def change
    create_table :generic_items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.string :uuid
      t.string :child_age_scope
      t.string :scores
      t.text :tips

      t.timestamps
    end
  end
end
