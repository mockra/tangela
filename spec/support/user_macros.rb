module UserMacros

  def sign_in( user )
    cookies[:auth_token] = user.auth_token
  end

  def log_out
    cookies[:auth_token] = nil
  end

end
