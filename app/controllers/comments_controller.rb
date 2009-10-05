class CommentsController < ApplicationController
  before_filter :user_profile
  def index

  end

  def new
    @comment = Comment.new
    @comment.ticket_id = params[:ticket_id]
    @comment.subject = "Re: #{@comment.ticket.category.name}"
    respond_to do |format|
      format.js { render 'new',  :layout => false }
    end
  end

  def create
      @comment = Comment.new(params[:comment])
      @comment.user_id = current_user.id
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
    @comment.subject = 'Re: ' + @comment.subject
    respond_to do |format|
      format.js { render 'edit', :layout => false  }
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    @comment.children << Comment.new(params[:comment].merge(:user => current_user ))
    respond_to do |format|
      format.js { render 'update.rjs' }
    end
  end

  def show
    @comment=Comment.find(params[:id])
    respond_to do |format|
      format.js { render 'show', :layout => false }
    end
  end

  def destroy
    @comment=Comment.find(params[:id])
    respond_to do |format|
       format.js { render 'destroy.rjs' }
     end
  end

  
  
end
