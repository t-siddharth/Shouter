class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    if cookies[:user_id] #so if statement is true 
    @current_user ||= User.find_by_id(cookies.signed[:user_id]) # or and
    end
  end
  helper_method :current_user
  
  def signed_in?
    current_user # !!current_user - bang bang operator; current_user ? true : false
  end
  helper_method :signed_in?
  
  def authorize
    if !signed_in?
      redirect_to new_session_url
    end
  end
  
  def sign_in(user)
    cookies.signed.permanent[:user_id] = user.id
  end
  
end
