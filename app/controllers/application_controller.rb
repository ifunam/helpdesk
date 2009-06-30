# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  layout nil
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :login_required
  def login_required
    if !session[:user_id].nil? and !User.find(session[:user_id]).nil?
      true
    else
      redirect_to sessions_url
      false
    end
  end
end
