class Auth::RegisterController < ApplicationController
  def index
  end

  def store
    # create user logic
    # validate params
    if params[:email].blank? || params[:password].blank?
      flash[:notice] = "Email or password is empty"
      return redirect_to action: "index"
    end

    # validate password confirmation
    if params[:password] != params[:password_confirmation]
      flash[:error] = "Password confirmation not match"
      return redirect_to action: "index"
    end

    # validate email is unique
    user = User.find_by(email: params[:email])
    if !user.nil?
      flash[:error] = "Email already exist"
      return redirect_to action: "index"
    end

    # create user
    user = User.create(email: params[:email], password: params[:password])
    if user.invalid?
      flash[:error] = "Error create user"
      return redirect_to action: "index"
    end

    # save user
    user.save
    flash[:success] = "Register success"
    redirect_to action: root_path
  end
end
