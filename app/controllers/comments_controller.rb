class CommentsController < ApplicationController
  def index
    
  end
  
  def new
    @comment=Comment.new
  end
  
  def create
    begin
      @comment=Comment.find(params[:parent])
      if @comment.children.create(params[:comment].merge(:subject => User.find(session[:user_id]),:ticket_id => params[:id] )).valid?
        redirect_to comment_path(@comment)
      else
        redirect_to ticket_path(Ticket.find(params[:id]))
      end
    rescue ActiveRecord::RecordNotFound
      @comment=Comment.new(params[:comment].merge(:subject => User.find(session[:user_id]),:ticket_id => params[:id]))
      if @comment.save
        redirect_to comment_path(@comment)
      else
        redirect_to ticket_path(Ticket.find(params[:id]))
      end
    end
  end
  
  def show
    @comment=Comment.find( params[:id] )
    @comments=Comment.find(:all,:conditions => {:parent_id => @comment.id})
  end
  
  def destroy
  end
  
end
