class ChangeNumBedsFieldToString < ActiveRecord::Migration
  def self.up
    change_column :accommodations, :number_of_beds, :string
  end

  def self.down
    change_column :accommodations, :number_of_beds, :integer
  end
end
