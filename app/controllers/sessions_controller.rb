
class SessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
   
  end

  def create

    #if AuthenticationClient.authenticate?(params[:user_session][:login], params[:user_session][:password]) 
           @user_session = UserSession.new(params[:user_session])
      if @user_session.save
      if !User.find_by_login(@user_session.login).is_tech
        flash[:notice] = 'Bienvenido(a)!'
        redirect_to tickets_url
      else
        redirect_to new_session_path
        flash[:notice] = 'El login o password es incorrecto!'
      end
    else
      flash[:notice] = 'El login o password es incorrecto!'
       redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    current_user_session.destroy
    flash[:notice] = 'Su sesión ha terminado (no regrese nunca)!'
    redirect_to new_session_path
  end

end
