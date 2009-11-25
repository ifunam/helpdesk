# -*- coding: utf-8 -*-
class TechSupport::SessionsController < SessionsController


  def create
    #if  AuthenticationClient.authenticate?(params[:user_session][:login],params[:user_session][:password]) and User.find_by_login(params[:user_session][:login]).is_tech?
    if !User.find_by_login(params[:user_session][:login]).nil? and User.find_by_login(params[:user_session][:login]).is_tech?
      session[:user] = User.find_by_login(params[:user_session][:login])
      flash[:notice] = 'Bienvenido(a)!'
      return_to tech_support_tickets_url
    else
      flash[:notice] = 'El login o password es incorrecto!'
      redirect_to :action => 'new'
    end
  end

  def destroy
    reset_session
    #current_user_session.destroy
    flash[:notice] = 'Gracias por utilizar STIFUNAM!'
    redirect_to new_tech_support_session_path
  end

end
