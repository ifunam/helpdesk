class AdminsController < ApplicationController
  layout 'support'
  def index
    @type = params[:type]
    respond_to do |format|
      format.js { render 'index.rjs' }
    end
  end
  
  def new
    @type=params[:t]
    self.instance_variable_set("@#{@type.to_s}", class_eval("#{@type.to_s.capitalize}.new"))
    respond_to do |format|
      format.js { render 'new.rjs'  }
    end
  end

  def create
  end

  def show
    @type = params[:type]
    respond_to do |format|
      format.js { render 'show.rjs' }
    end
  end

  def edit
  end

  def update
  end

  def destroy
    #Status.delete(params[:id])
    @type = params[:type]
    class_eval "#{@type.to_s.capitalize}.delete(#{params[:id]})"
    respond_to do |format|
      format.js { render 'show.rjs' }
    end
  end

end
