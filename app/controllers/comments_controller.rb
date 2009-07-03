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

  # def show
  #    @comment=Comment.find( params[:id] )
  #    @comments=Comment.find(:all,:conditions => {:parent_id => @comment.id})
  #  end
  # 
  #  def destroy
  #  end
  #  
end
