# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'redcloth'
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :login_required
  helper_method :current_user_session, :current_user

private
  def user_profile
    @user_profile = UserProfileClient.find_by_login(current_user.login)
  end

  def current_user
     session[:user] if defined? session[:user]
  end

  def login_required
    if session[:user].nil?
      session[:redirect_to] = request.request_uri
      redirect_to :controller=> :sessions, :action => 'new'
      return false
    end

    return true
  end

  def return_to(controller)
    controller = session[:redirect_to] unless session[:redirect_to].nil?
    session[:redirect_to] = nil
    redirect_to controller, :protocol => 'http'
  end
end
