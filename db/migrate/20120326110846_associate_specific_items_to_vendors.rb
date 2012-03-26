class AssociateSpecificItemsToVendors < ActiveRecord::Migration
  def up
    remove_column :specific_items, :vendor
    add_column :specific_items, :vendor_id, :integer
  end

  def down
    remove_column :specific_items, :vendor_id
    add_column :specific_items, :vendor, :string
  end
end
