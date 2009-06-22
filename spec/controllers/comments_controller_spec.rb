require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe CommentsController do

  before(:each) do
    session[:user_id]= 1
    @comment=Factory.attributes_for(:comment)
  end

  it "should render index view succesfuly" do
    get 'index'
    response.should be_success
  end

end
