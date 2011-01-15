class DeviseCreateLogins < ActiveRecord::Migration
  def self.up
    create_table(:logins) do |t|
      t.database_authenticatable :null => false
      t.token_authenticatable
      t.timestamps
    end

    add_index :logins, :email,                :unique => true
  end

  def self.down
    drop_table :logins
  end
end
