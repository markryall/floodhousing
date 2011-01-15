class AddLoginToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodation, :login_id
    
  end

  def self.down
    remove_column :accommodation, :login_id
    
  end
end
