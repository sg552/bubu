class AddAdditionalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :baby_gender, :string
    add_column :users, :baby_age, :string
  end
end
