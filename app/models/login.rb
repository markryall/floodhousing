class Login < ActiveRecord::Base
  devise :database_authenticatable, :token_authenticatable, :trackable
  attr_accessible :email, :password, :password_confirmation, :authentication_token
end
