
class SessionsController < ApplicationController
  include SslRequirement
  skip_before_filter :login_required

  ssl_required :new, :create  if RAILS_ENV == 'production'

  def new
    flash[:notice]= " "
    @user_session = UserSession.new

  end

  def create
     if  AuthenticationClient.authenticate?(params[:user_session][:login],params[:user_session][:password]) and User.exists?(:login => params[:user_session][:login])
      session[:user] = User.find_by_login(params[:user_session][:login])
      flash[:notice] = 'Bienvenido(a)!'
      return_to tickets_url
    else
      flash[:notice] = 'El login o password es incorrecto!'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    #current_user_session.destroy
    flash[:notice] = 'Gracias por utilizar STIFUNAM!'
    redirect_to new_session_path
  end
end
