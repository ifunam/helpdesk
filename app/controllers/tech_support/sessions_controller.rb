# -*- coding: utf-8 -*-
class TechSupport::SessionsController < SessionsController



  def create
    if  AuthenticationClient.authenticate?(params[:user_session][:login],params[:user_session][:password])
    #if !User.find_by_login(params[:user_session][:login]).nil?
     @user =User.find_by_login(params[:user_session][:login])
      if !@user.nil? and @user.is_tech?
            session[:user] = @user
        flash[:notice] = 'Bienvenido(a)!'
        redirect_to tech_support_tickets_url
      else
        flash[:notice] = 'El login o password es incorrecto!'
        redirect_to :controller => '/tech_support/tickets', :protocol => 'http'
      end

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
