class Auth::LoginController < ApplicationController  
  def index
  end

  def store
    
    # TODO: validate params, credentials then set cookie session
    messages = validate
    if messages.length > 0
      flash[:notice_list] = messages
      return redirect_to action: "index"
    end

    request = params.permit(:email, :password)
    user = User.find_by(email: request[:email])
    if user.nil?
      flash[:error] = "Email not found"
      return redirect_to action: "index"
    end

    if !user.authenticate(request[:password])
      flash[:error] = "Password not match"
      return redirect_to action: "index"
    end

    session[:user_id] = user.id
    flash[:success] = "Login success"
    redirect_to root_path
  end

  def validate
    messages = []
    if params[:email] && params[:email].strip.blank?
      messages.push("Email is empty")
    end

    if params[:password] && params[:password].strip.blank?
      messages.push("Password is empty")
    end

    return messages
  end
end
