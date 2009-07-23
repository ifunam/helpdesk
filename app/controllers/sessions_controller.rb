class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
    @user = User.new
  end

  def create
     if User.authenticate(params[:user][:login],params[:user][:password])
       flash[:notice] = 'Bienvenido(a)!'
       session[:user_id] = User.find_by_login(params[:user][:login]).id
       if User.find(session[:user_id]).is_admin
         options = { :controller => 'support_tickets'}
       else
         options = { :controller => 'tickets'}
       end
       
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
  end

end
