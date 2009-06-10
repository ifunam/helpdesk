class SessionsController < ApplicationController
  def index
    @user=User.new
  end

  def create
     if User.authenticate(params[:user][:login],params[:user][:password])
       flash[:notice] = 'Bienvenido(a)!'
       session[:id] = User.find_by_login(params[:user][:login]).id
       session[:type]= User.find(session[:id]).is_admin? ? 2 : 1
       options = { :controller => :tickets }
  
     else
       flash[:notice] = 'El login o password es incorrecto!'
       options = { :action => :index }
   end
     respond_to do |format|  
      format.html { redirect_to options }
    end


  end

  def destroy
    reset_session
    render :action => :signout
  end

end
