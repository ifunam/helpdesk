class AdminsController < ApplicationController

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
    @type=params[:type]
    self.instance_variable_set("@#{@type.to_s}", class_eval("#{@type.to_s.capitalize}.new"))
    self.instance_variable_get("@#{@type.to_s}").name = params[@type][:name]
    respond_to do |format|
     if self.instance_variable_get("@#{@type.to_s}").save
       format.js { render 'show.rjs' }
     else
       format.js { render 'errors.rjs'}
     end
    
    end
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
    @type = params[:type]
    class_eval "#{@type.to_s.capitalize}.delete(#{params[:id]})"
    respond_to do |format|
      format.js { render 'show.rjs' }
    end
  end

end
