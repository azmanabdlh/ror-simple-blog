class WelcomeController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @current_user = User.find_by(id: session[:user_id])    
  end

  def authenticate_user
    unless session[:user_id].present?
      redirect_to auth_login_path, alert: "Please login first"
    end
  end
end
