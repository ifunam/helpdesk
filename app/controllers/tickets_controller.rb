# -*- coding: utf-8 -*-
class TicketsController < ApplicationController
  def index
    @tickets= Ticket.all(:conditions => {:user_id => session[:user_id]})
  end

  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(params[:ticket].merge(:user_id => session[:user_id]))
    if @ticket.save 
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  def show
    @ticket =Ticket.find(params[:id])
    
  end

  def destroy
    Ticket.delete(params[:id])
    redirect_to :action => 'index'
  end

end
