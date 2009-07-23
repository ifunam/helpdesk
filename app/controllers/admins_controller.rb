class AdminsController < ApplicationController
  layout 'support'
  def index
  end

  def new
  end

  def create
  end

  def show
     @type = params[:type].to_s
     respond_to do |format|
       format.js { render 'show.rjs' }
     end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
