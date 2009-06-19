# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hhbd.pl_session',
  :secret      => 'cf469d8cafb36abc13c527cf5a9c602a6cbaf32ad8b2f35c3e508ce7d67f0bdc85d7a91ccc8fd3d2eceeb26dbd52b7fe1a44b710d7b8ba65ef980ebcc26bd70d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
