require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe SessionsController do


  it "should get index" do
    get 'index'
    response.should be_success
  end

  it "should create session sucessfully" do
    post :create, :user => { :login => 'carlos', :password => 'frederic'}
    should redirect_to(tickets_url)
    response.session[:user_id].should eql(1)
  end

  it "should not create session with bad password" do
    post :create, :user => { :login => 'carlos', :password => 'iamsad'}
    should redirect_to(sessions_url)
    response.session[:user_id].should nil
  end

  it "should destroy session" do
    post :create, :user => { :login => 'carlos', :password => 'frederic'}
    should redirect_to(tickets_url)
    post :destroy, :id =>  response.session[:user_id]
    response.should be_success
    response.should render_template(:signout)
  end

end
