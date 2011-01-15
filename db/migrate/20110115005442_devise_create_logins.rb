class DeviseCreateLogins < ActiveRecord::Migration
  def self.up
    create_table(:logins) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :logins, :email,                :unique => true
    add_index :logins, :reset_password_token, :unique => true
    # add_index :logins, :confirmation_token,   :unique => true
    # add_index :logins, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :logins
  end
end
