class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
    @user = User.new
  end

  def create
     if User.authenticate(params[:user][:login],params[:user][:password])
       flash[:notice] = 'Bienvenido(a)!'
       session[:user_id] = User.find_by_login(params[:user][:login]).id
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
