module UserMacros

  def sign_in( user )
    cookies[:auth_token] = user.id
  end

end
