class AddExtraAddressFieldToAccommodation < ActiveRecord::Migration
  def self.up
      add_column :accommodations, :postcode, :string
      add_column :accommodations, :state, :string
  end

  def self.down
      remove_column :accommodations
      remove_column :accommodations
  end
end
