class TicketsController < ApplicationController
  def index
    @user_profile = UserProfileClient.find_by_login(current_user.login)
    @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user_id = current_user.id
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
#    puts @order_by
    respond_to do |format|
      format.js { render 'update.rjs' }
    end
  end
end

