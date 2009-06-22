require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe TicketsController do
  
  before(:each) do
    session[:user_id]= 1
    @ticket=Factory.attributes_for(:ticket)
  end

 
  context "when use index with saved records" do
    it "should render index view successfuly" do
      get 'index'
      response.should be_success
    end
    
    it "should should include all saved records" do
      get 'index'
      assigns[:tickets].should_not be_nil
    end
  end
  
  context "when try to post a valid ticket" do
    it "should create a new record" do
      post :create, :ticket => @ticket
      should redirect_to(tickets_url)
    end
  end
    
    
  
  context "when try to post invalid ticket" do

    it "should not create a new record with invalid attributes" do
      @it= Factory.attributes_for(:ticket_invalid)
      post :create, :ticket => @it
      should redirect_to(new_ticket_path)
    end
    
    it "should not create a new record without body" do
      @ticket[:body]= nil
      post :create, :ticket => @ticket
      should redirect_to(new_ticket_path)
    end
    
    it "should not create a new record without category_id" do
      @ticket[:category_id]= nil
      post :create, :ticket => @ticket
      should redirect_to(new_ticket_path)
    end
    
  end
    
  context "action of one ticket" do
    it "should display one ticket" do
      post :create, :ticket => @ticket
    end
    
    it "should cancel a ticket" do
      post :create, :ticket => @ticket
      should redirect_to(tickets_url)
      post :destroy, :id => @ticket[:id]
      response.should redirect_to(tickets_url)
    end
  end
  
end
