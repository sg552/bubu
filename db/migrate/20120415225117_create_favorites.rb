class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :generic_item_id
      t.integer :user_id
      t.timestamps
    end
  end
  def self.down
    drop_table :favorites
  end
end
