
class SessionController < ApplicationController
  def index
    @user=User.new
  end

  def signup

     if User.authenticate(params[:user][:login],params[:user][:password])
       flash[:notice] = 'Bienvenido(a)!'
       session[:user] = User.find_by_login(params[:user][:login]).id
       options = { :controller => :tickets }
  
     else
       flash[:notice] = 'El login o password es incorrecto!'
       options = { :action => :index }
   end
     respond_to do |format|  
      format.html { redirect_to options }
    end


  end

  def signout
  end

end
