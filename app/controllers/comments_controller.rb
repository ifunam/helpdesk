class CommentsController < ApplicationController
  def index

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.js { render 'create.rjs' }
      else
        format.js { render 'errors.rjs'}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment.body = nil
    respond_to do |format|
      format.html { render 'edit' }
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
  # def show
  #    @comment=Comment.find( params[:id] )
  #    @comments=Comment.find(:all,:conditions => {:parent_id => @comment.id})
  #  end
  # 
  #  def destroy
  #  end
  #  
end
