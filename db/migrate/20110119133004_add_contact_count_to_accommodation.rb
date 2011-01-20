class AddContactCountToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :contact_count, :integer, :default => 0
  end

  def self.down
    remove_column :accommodations, :contact_count
  end
end
