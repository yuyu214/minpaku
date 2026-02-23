# app/helpers/sessions_helper.rb
module SessionsHelper
  def my_current_user
    return unless session[:user_id]
    @my_current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    my_current_user.present?
  end
end
