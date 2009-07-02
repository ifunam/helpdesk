class CommentsController < ApplicationController
  def index
    #TODO:: se mostrara el ticket creado y posteriormente  sus hijos
    @comment=Comment.new
  end
  
  def new
    @comment=Comment.new
  end
  
  def create
    @comment=Comment.new(params[:comment].merge(:subject => User.find(session[:user_id]),:ticket_id => params[:id] ))
    @root=@comment.root
    if @root==@comment
      @comment.save
      redirect_to ticket_path(Ticket.find (params[:id]))
    else
      @comment=@root.children.create(params[:comment].merge(:subject => User.find(session[:user_id]),:ticket_id => params[:id]))
      redirect_to ticket_comment_path(@comment)
    end
  end
  
  def show
    @comment2=Comment.find(params[:id])
  end
  
  def destroy
  end
  
end
