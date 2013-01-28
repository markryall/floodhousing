class AddDeviseToLogins < ActiveRecord::Migration
  def self.up
    create_table(:logins) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Token authenticatable
      t.string :authentication_token
    end

    add_index :logins, :email,                :unique => true
  end

  def self.down
    drop_table :logins
  end
end
