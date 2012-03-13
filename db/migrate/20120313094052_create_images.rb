class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :generic_item_id
      t.has_attached_file :itself
      t.timestamps
    end
  end
  def self.down
    drop_attached_file :generic_items, :itself
    drop_table :images
  end
end
