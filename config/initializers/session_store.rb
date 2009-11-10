# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pipeline_session',
  :secret      => 'ac02c3d757b3a8544f9749fdc5e29c020504a6785f510207ec6e8513432cbb065daa8a60b7382b6e07a4355579d39ed3d8dc0dce8d54289d69b2723e6f54a26a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
