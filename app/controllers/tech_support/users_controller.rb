class TechSupport::UsersController < ApplicationController
  before_filter :user_profile

  def index
    @collection = User.all.paginate(:page => params[:page] || 1,   :per_page => params[:per_page] || 5 )
  end
  
  def new
  @user=User.new
  end
  
  def create
    @user = @User.new(params[:record])
    if @record.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to :action => 'index'
    end
  end
end
