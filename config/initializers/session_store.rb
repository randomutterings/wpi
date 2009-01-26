# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wpi_session',
  :secret      => 'ae1af9e7411c8be9094198b756fdf1413fe6257a7d1734047d542d44d0feec3406d949292737b503a9bf35da20687c678d5b89c6e7e522f7567a23c6ab109bc3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
