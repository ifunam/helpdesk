class CommentsController < ApplicationController
  def index

  end

  def new
    @comment = Comment.new
    @ticket=Ticket.find(params[:ticket_id])
    @parameters = {:url => comments_path, :subject => "Re: #{@ticket.category.name}",:id => @ticket.id}
    respond_to do |format|
      format.js { render 'comment_form.rjs' }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        if @comment.parent.nil?
          format.js { render 'create.rjs' }
        else
          format.js { render 'child_create.rjs' }
        end
      else
        format.js { render 'errors.rjs'}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment.body = nil
    @parameters = { :url => comment_path(@comment), :subject => "Re:#{@comment.subject}",:id => @comment.ticket_id}
    respond_to do |format|
      format.js { render 'edit.rjs' }
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.children << Comment.new(params[:comment])
    respond_to do |format|
      format.js { render 'update.rjs' }
    end
  end

  def show
    @comment=Comment.find(params[:id])
    respond_to do |format|
      format.js { render 'show.rjs' }
    end
  end

  def destroy
    respond_to do |format|
      format.js { render 'destroy.rjs' }
    end
  end

  
  
end
