# -*- coding: utf-8 -*-

class SessionsController < ApplicationController
  include SslRequirement
  skip_before_filter :login_required

  ssl_required :new, :create  if RAILS_ENV == 'production'

  def new
    @user_session = UserSession.new
    #flash[:notice]= " "
  end

  def create
    if User.authenticate?(params[:user_session][:login],params[:user_session][:password])
      session[:user] = User.find_by_login(params[:user_session][:login])
      return_to tickets_url
    else
      flash[:notice] = 'El nombre de usuario o contraseña es incorrecto'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    #current_user_session.destroy
    redirect_to new_session_path
  end
end
