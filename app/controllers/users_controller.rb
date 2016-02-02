class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, flash: { error: "User saved successfully!!" }
    else
      flash[:error] = 'Error'
      render 'new'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end