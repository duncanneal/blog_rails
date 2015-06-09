class SessionsController < ApplicationController
def create
    email, password = params.values_at(:email, :password)
    user = User.find_by(email: email).try(:authenticate, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} logged in."
    else
      flash[:notice] = "Login failed."
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to root_path
  end
end

