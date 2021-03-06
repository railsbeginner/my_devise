module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in
    !current_user.nil?
  end

  def authenticate_user
    redirect_to root_path, flash: { notice: 'You need to log in before continuing!' } unless user_signed_in
  end
end
