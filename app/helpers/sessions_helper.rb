module SessionsHelper
  def sign_in
    session[:user_id] = @user.id
  end

  def logged_in?
    require 'pry'; binding.pry
    !Current.user.nil?
  end
end
