class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :generic_item_id

      t.timestamps
    end
  end
end
