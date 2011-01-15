class AddTokenToLogin < ActiveRecord::Migration
  def self.up
      add_column :logins, :authentication_token, :string
  end

  def self.down
    remove_column :logins, :authentication_token, :string
  end
end
