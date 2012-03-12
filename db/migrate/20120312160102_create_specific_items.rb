class CreateSpecificItems < ActiveRecord::Migration
  def change
    create_table :specific_items do |t|
      t.string :price
      t.string :word_of_mouth
      t.string :delivery_method
      t.integer :generic_item_id
      t.string :vendor
      t.string :source_website_name
      t.text :source_url

      t.timestamps
    end
  end
end
