class TechSupport::CatalogsController < ApplicationController
  def index
    @collection = @model.all.paginate(:page => params[:page] || 1,   :per_page => params[:per_page] || 10 )
    render 'tech_support/catalogs/index'
  end

  def new
    @record = @model.new
    render 'tech_support/catalogs/new'
  end

  def create
    @record = @model.new(params[:record])
    if @record.save
      redirect_to :action => 'index'
    else
      render 'tech_support/catalogs/new'
    end
  end

  def edit
    @record = @model.find(params[:id])
    render 'tech_support/catalogs/edit'
  end

  def update
    @record = @model.find(params[:id])
    if @record.update_attributes(params[:record])
      redirect_to :action => 'index'
    else
      render 'tech_support/catalogs/edit'
    end
  end

  def show
    @record = @model.find(params[:id])
    render 'tech_support/catalogs/show'
  end

  def destroy
    @record = @model.find(params[:id])
    if @record.destroy
      redirect_to :action => 'index'
    end
  end
end
