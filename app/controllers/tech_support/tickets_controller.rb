class TechSupport::TicketsController < TicketsController
  
 def index
   @user = User.find(session[:user_id])
   @user_profile = UserProfileClient.find_by_login(@user.login)
   @tickets = []
   @user.categories.each do |category|
      category.tickets.collect { |ticket| @tickets << ticket }
   end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to :action => 'index'
    else 
      render 'edit'
    end
  end

end

