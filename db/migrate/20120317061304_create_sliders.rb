class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :content
      t.text :target_url
      t.integer :image_id

      t.timestamps
    end
  end
end
