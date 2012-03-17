class AddDefaultValueToScoresOfGenericItems < ActiveRecord::Migration
  def self.up
    change_column_default :generic_items, :scores, 0
  end
  def self.down
    change_column_default :generic_items, :scores, nil
  end
end
