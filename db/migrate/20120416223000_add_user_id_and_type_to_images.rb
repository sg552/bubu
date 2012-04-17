class AddUserIdAndTypeToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :integer
    add_column :images, :type, :string
  end
end
