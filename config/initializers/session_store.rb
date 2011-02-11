# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_haad_is_session',
  :secret      => '7d5e57b908aa1a887fff65fb0d175aebbae8edf1caa61e26819105b1a640347a905ef33f16f55f2674dbdc74c2afa4adfe6df57783bd6e5abf711ed14812d9e2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
