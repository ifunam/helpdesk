require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe TicketsController do
  integrate_views
  before(:each) do
    session[:user_id]= 1# Factory(:user).id

  end
  it "should be successful" do
    get 'index'
    response.should be_success
  end

  it "should create a new record" do
    post :create, :ticket => Factory.attributes_for(:ticket)
    should redirect_to(tickets_url)
    #  response.should render_template(:index)    
  end

  it "should not create a new record with invalid attributes" do
    #post :create, :ticket => Factory.invalid_attributes_for(:ticket)
    #should redirect_to(new_ticket_path)
  end
  
end
