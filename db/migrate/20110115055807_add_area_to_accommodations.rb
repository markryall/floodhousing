class AddAreaToAccommodations < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :area, :string
  end

  def self.down
    remove_column :accommodations, :area
  end
end
