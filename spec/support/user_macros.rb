module UserMacros

  def sign_in( user )
    cookies[:auth_token] = user.auth_token
  end

  def log_out
    cookies[:auth_token] = nil
  end

  def login_as user
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'Log In'
  end

end
