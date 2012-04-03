class MoveVendorIdFromSpecificItemsToGenericItems < ActiveRecord::Migration
  def change
    remove_column :specific_items, :vendor_id
    add_column :generic_items, :vendor_id, :integer
  end
end
