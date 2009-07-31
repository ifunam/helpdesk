class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
    @user = User.new
  end

  def create
     if User.authenticate?(params[:user][:login],params[:user][:password])
       flash[:notice] = 'Bienvenido(a)!'
       session[:user_id] = User.find_by_login(params[:user][:login]).id
       redirect_to tickets_url
     else
       flash[:notice] = 'El login o password es incorrecto!'
       render 'new'
     end
  end

  def destroy
    reset_session
    flash[:notice] = 'Su sesión ha terminado (no regrese nunca)!'
    redirect_to new_session_path
  end

end
