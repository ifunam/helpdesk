# -*- coding: utf-8 -*-
class TechSupport::SessionsController < SessionsController

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if User.find_by_login(@user_session.login).is_tech
        flash[:notice] = 'Bienvenido(a)!'
        redirect_to tech_support_tickets_url
      else
        flash[:notice] = 'El login o password es incorrecto!'
        redirect_to new_tech_support_session_path
      end
      
    else
      flash[:notice] = 'El login o password es incorrecto!'
      render 'new'
    end
  end

  def destroy
    reset_session
    current_user_session.destroy
    flash[:notice] = 'Su sesión ha terminado (no regrese nunca)!'
    redirect_to new_tech_support_session_path
  end
  
end
