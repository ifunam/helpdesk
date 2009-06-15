require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @comment = Factory(:comment)
  end

  it "Should not be valid" do
    @comment2=Comment.new
    @comment2.should_not be_valid
  end
  
  it "should be valid" do
    @comment.should be_valid
  end


it "Should not be valid without a body" do
    @comment.body = nil
    @comment.should_not be_valid
  end

  it "Should not be valid without a subject" do
    @comment.subject = nil
    @comment.should_not be_valid
  end

  it "Should not be valid without a ticket" do
    @comment.ticket_id = nil
    @comment.should_not be_valid
  end

  # it "Should  be parent" do
  #     parent_id=@comment.parent_id
  #     parent_id.should == nil
  #   end
  
end
