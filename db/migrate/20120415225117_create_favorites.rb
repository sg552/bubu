class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :generic_item_id
      t.integer :user_id
      t.timestamps
    end
    remove_column :generic_items, :scores
  end
  def self.down
    drop_table :favorites
    add_column :generic_items, :scores, :string
  end
end
