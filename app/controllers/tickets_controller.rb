class TicketsController < ApplicationController

    def index
      @user = User.find(session[:user_id])
      #@user_profile = UserProfileClient.find_by_login(@user.login)
      @tickets = Ticket.all :order => 'created_at DESC'
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

    
    
    def update
      @order_by = params[:order_by]
      @conditions =params[:conditions]
      puts @order_by
      respond_to do |format|
        format.js { render 'update.rjs' }
      end
    end

    

  end
 
