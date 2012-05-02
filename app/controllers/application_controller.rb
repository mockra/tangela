class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find cookies[:auth_token] if cookies[:auth_token]
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate
    redirect_to new_session_url unless signed_in?
  end

  helper_method :current_user
end
