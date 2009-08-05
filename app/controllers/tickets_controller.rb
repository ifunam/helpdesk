class TicketsController < ApplicationController
  def index
    @user_profile = UserProfileClient.find_by_login(current_user.login)
    @tickets = Ticket.paginate_all(params[:page], params[:per_page])
  end
  
  def list_by_category
    @category = Category.find(params[:id])
    session[:filter_category_id] =  @category.id
    @tickets = Ticket.paginate_all_by_category_id(@category.id, params[:page], params[:per_page])
    render :partial => 'collection'
  end
  
  def list_by_date
    if session[:filter_category_id].nil?
      @tickets = Ticket.all(:order => "created_at #{params[:order] || 'DESC'}").paginate(:page => params[:page], :per_page => 5)
    else
      @tickets = Ticket.paginate_all_by_category_id(session[:filter_category_id], params[:page], params[:per_page], params[:order])
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
    @order_by = params[:order_by]
    @conditions =params[:conditions]
#    puts @order_by
    respond_to do |format|
      format.js { render 'update.rjs' }
    end
  end
end

