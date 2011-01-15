class RenameEnabledField < ActiveRecord::Migration
  def self.up
    rename_column :accommodations, 'enabled', 'available'
  end

  def self.down
    rename_column :accommodations, 'available', 'enabled'
  end
end
