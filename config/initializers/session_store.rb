# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gravatar_session',
  :secret      => '4512a09b7f1a8470d8cbba0adf06ffe1748484fba48e1af5745418df726c6280dc630a033f92f832b8eb36aad7d12d42d8aef9fb7605e4d4af6a49ccad618716'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
