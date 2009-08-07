# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #   layout nil
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :activate_authlogic
  helper_method :current_user_session, :current_user

  def user_profile
    @user_profile = UserProfileClient.find_by_login(current_user.login)
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  
  
end
