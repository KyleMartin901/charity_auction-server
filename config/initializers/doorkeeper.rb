Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_from_credentials do
    user = User.find_by(email_address: params[:username])
    user && user.authenticate(params[:password])
  end

  # Disable Access token expiration time
  access_token_expires_in nil

  # Set the way access token is authenticated from the request object.
  access_token_methods :from_bearer_authorization

  # Specify what grant flows are enabled in array of Strings
  grant_flows %w(password)
end
