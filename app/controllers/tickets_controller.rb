class TicketsController < ApplicationController

    def index
      @user = User.find(session[:user_id])
      #@user_profile = UserProfileClient.find_by_login(@user.login)
      @tickets = get_tickets(params[:order_by])
    end

    def new
      @ticket = Ticket.new
    end

    def create
      @ticket = Ticket.new(params[:ticket])
      @ticket.user_id = session[:user_id]
      if @ticket.save
        redirect_to :action => :index
      else
        render 'new'
      end
    end


    def show
      @ticket = Ticket.find(params[:id])
    end

    def destroy
      Ticket.destroy(params[:id])
      redirect_to :action => 'index'
    end

    def get_tickets(order_by)
      order_by= (order_by.nil?)? 'created_at ASC':nil
      Ticket.all :order => order_by
      
    end
   

  end
 
