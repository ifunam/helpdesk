class TicketsController < ApplicationController
  def index
    session[:search] = {}
    @tickets = Ticket.search_and_paginate(params[:search], params[:page])
  end

  def search
    @tickets = Ticket.search_and_paginate(params[:search].merge(session[:search]),params[:page])
    respond_to do |format|
      format.js { render :partial => 'tickets_collection' }
      format.html { render 'index' }
    end
  end

  def search_category
    session[:search][:category_id] = params[:search][:category_id] unless params[:search][:category_id].nil?
    @tickets = Ticket.search_and_paginate(params[:search].merge(session[:search]),params[:page])
    respond_to do |format|
      format.js { render :partial => 'tickets_collection' }
      format.html { render 'index' }
    end
  end

  def search_priority
    session[:search][:priority_id] = params[:search][:priority_id] unless params[:search][:priority_id].nil?
    @tickets = Ticket.search_and_paginate(params[:search].merge(session[:search]),params[:page])
    respond_to do |format|
      format.js { render :partial => 'tickets_collection' }
      format.html { render 'index' }
    end
  end

  def search_status
    session[:search][:status_id] = params[:search][:status_id] unless params[:search][:status_id].nil?
    @tickets = Ticket.search_and_paginate(params[:search].merge(session[:search]),params[:page])
    respond_to do |format|
      format.js { render :partial => 'tickets_collection' }
      format.html { render 'index' }
    end
  end




  def my_list
    @tickets = Ticket.search_and_paginate({ :user_id => current_user.id }, params[:page])
    session[:search] = { :user_id => current_user.id }
    render 'index'
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.user_id = current_user.id
    if @ticket.save
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
