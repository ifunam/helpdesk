# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end

  def create
     @user_session = UserSession.new(params[:user_session])
     if @user_session.save
       flash[:notice] = 'Bienvenido(a)!'
       redirect_to tickets_url
     else
       flash[:notice] = 'El login o password es incorrecto!'
       render 'new'
     end
  end

  def destroy
    reset_session
    current_user_session.destroy
    flash[:notice] = 'Su sesión ha terminado (no regrese nunca)!'
    redirect_to new_session_path
  end

end
