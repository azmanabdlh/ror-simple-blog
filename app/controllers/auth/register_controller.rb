class Auth::RegisterController < ApplicationController
  def index
    @user = User.new
  end

  def store
    # create user logic
    req = params.require(:user).permit(:name, :email, :password, :password_confirmation)
  
    # validate password confirmation
    if req[:password] != req[:password_confirmation]
      flash[:error] = "Password confirmation not match"
      return redirect_to action: "index"
    end


    # create user
    user = User.create(req)
    if user.invalid?
      flash[:error] = user.errors.full_messages.join(", ")
      return redirect_to action: "index"
    end

    # save user
    user.save

    # redirect to login page
    session[:user_id] = user.id
    flash[:success] = "Register success, welcome #{user.name}"
    redirect_to root_path
  end
end
