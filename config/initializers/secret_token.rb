# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Flood::Application.config.secret_token = ENV['RAILS_SECRET'] || '89a01b3d1727cfb48d642c0b79612eb78639ed3b1a55c0340dbd120860d566c490ea7cd2d1bb2f76254594e10578ce5f9cbc6e3f5207377830400aa60757a10a'
