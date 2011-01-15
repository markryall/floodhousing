class ModifyAccommodationFields < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :takes_pets_comment, :string
    add_column :accommodations, :takes_disabled, :boolean
    add_column :accommodations, :takes_storage, :boolean
    add_column :accommodations, :takes_storage_comment, :string
    
    rename_column :accommodations, :number_of_people, :number_of_beds
    remove_column :accommodations, :takes_other_needs
    remove_column :accommodations, :takes_family
  end

  def self.down
    remove_column :accommodations, :takes_pets_comment
    remove_column :accommodations, :takes_disabled
    remove_column :accommodations, :takes_storage
    remove_column :accommodations, :takes_storage_comment
    
    rename_column :accommodations, :number_of_beds, :number_of_people
    add_column :takes_other_needs, :boolean
    add_column :takes_family, :boolean
  end
end
