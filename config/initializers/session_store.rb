# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_help_desk_session',
  :secret      => 'b47c1b6436be0dc83176044cfc25c08152cac97a903fc17078953f1000b1351a904f9afefac6fc81772c72fa764974ae3f19ab418742daa2e251970bf5bcc132'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
