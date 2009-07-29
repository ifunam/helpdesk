class SharedController < ApplicationController

  def index
    @collection = @model.all
  end
  
  def new
    @record = @model.new
  end
  def create
    @record = @model.new(params[:record])
  end
end