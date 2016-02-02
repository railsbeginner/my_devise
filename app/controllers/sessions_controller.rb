class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user, flash: { notice: "User logged in successfully" }
    else
      flash[:error] = 'Wrong username / password.'
      render 'new'
    end
  end
end