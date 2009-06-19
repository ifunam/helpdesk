require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe TicketsController do
#  integrate_views

  before(:each) do
    session[:user_id]= 1
    @ticket=Factory.attributes_for(:ticket)
  end

  it "should be successful" do
    get 'index'
    response.should be_success
  end

  it "should create a new record" do
    post :create, :ticket => @ticket
    should redirect_to(tickets_url)
  end

  it "should not create a new record with invalid attributes" do
    @invalid_ticket=@ticket
    @invalid_ticket[:category_id]=nil
    @invalid_ticket[:body]= nil
    post :create, :ticket => @invalid_ticket
    should redirect_to(new_ticket_path)
  end

  

  # it "should show all tickets in index view" do
#     @u=User.new(Factory.attributes_for(:user))
#     get 'index'
#     response.should be_success
#     post :index, :tickets => @u.
#   end

  it "should display one ticket" do
    #post :create, :ticket => @ticket
    #response.should be_success
  end

  it "should cancel a ticket" do
    post :create, :ticket => @ticket
    should redirect_to(tickets_url)
    post :destroy, :id => @ticket[:id]
    #response.should be_success
    response.should redirect_to(tickets_url)
  end

 end
