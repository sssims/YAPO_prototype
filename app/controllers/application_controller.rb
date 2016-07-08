class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_filter :get_current_user
  before_filter :get_today

  def get_current_user 
    if session[:user_id]
      @current_user = User.find session[:user_id]
    else
      @current_user = nil
    end
  end

  def get_today
    @today_date = Date.today
    @today_time = Time.now
  end

end
