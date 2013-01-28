class CreateAccommodations < ActiveRecord::Migration
  def self.up
    create_table :accommodations do |t|
      t.string :address1
      t.string :address2
      t.string :suburb
      t.string :name
      t.string :phone_mobile
      t.string :phone_home
      t.string :other_phone
      t.string :email
      t.string :comments
      t.integer :number_of_people
      t.boolean :takes_pets
      t.boolean :takes_family
      t.boolean :takes_children
      t.boolean :takes_other_needs

      t.timestamps
    end
  end

  def self.down
    drop_table :accommodations
  end
end
