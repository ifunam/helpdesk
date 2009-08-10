class TicketsController < ApplicationController
  before_filter :user_profile
  layout 'tickets'
  def index
    session[:filter_category_id] = nil
    @tickets = Ticket.paginate_all(params[:page], 5)
  end
  
  def list_by_category
    session[:filter_category_id] = Category.find(params[:id]).id
    puts "la categoria es #{session[:filter_category_id]}"
    @tickets = Ticket.paginate_all_by_category_id(session[:filter_category_id], params[:page], 5)
    render :partial => 'tickets_collection'
  end
  
  def list_by_date
     if session[:filter_category_id].nil?
       @tickets = Ticket.paginate_all(params[:page],5,params[:order])
     else
       @tickets = Ticket.paginate_all_by_category_id(session[:filter_category_id], params[:page],5 , params[:order])
     end
    render 'index'
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
    
  end

end

