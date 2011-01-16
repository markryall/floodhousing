class RemoveStateFromAccommodations < ActiveRecord::Migration
  def self.up
    remove_column :accommodations, :state   
  end

  def self.down
    add_column :accommodations, :state, :string
  end
end
