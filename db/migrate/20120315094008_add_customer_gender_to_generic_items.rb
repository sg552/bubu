class AddCustomerGenderToGenericItems < ActiveRecord::Migration
  def change
    add_column :generic_items, :customer_gender, :string

  end
end
