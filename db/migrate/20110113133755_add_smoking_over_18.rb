class AddSmokingOver18 < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :over_eighteen, :boolean
    add_column :accommodations, :takes_smokers, :boolean
  end

  def self.down
    remove_column :accommodations, :over_eighteen, :boolean
    remove_column :accommodations, :takes_smokers, :boolean
  end
end
