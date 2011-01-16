class AddTermsAndConditionsAcceptedToAccommodations < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :terms_and_conditions_accepted, :boolean
  end

  def self.down
    remove_column :accommodations, :terms_and_conditions
  end
end
