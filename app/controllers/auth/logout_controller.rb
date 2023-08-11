class Auth::LogoutController < ApplicationController
  def store
    session.delete(:user_id)
    redirect_to auth_login_path
  end
end
