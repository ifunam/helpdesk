require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ticket do
  before(:each) do
    @ticket = Factory(:ticket)
  end
  it "Should be valid" do
    @ticket.should be_valid
  end
   it "Should not be valid without a body" do
    @ticket.body = nil
    @ticket.should_not be_valid
  end

  it "Should not be valid without a category" do
    @ticket.category_id = nil
    @ticket.should_not be_valid
  end

  it "Should not be valid without a status" do
    @ticket.status_id = nil
    @ticket.should_not be_valid
  end

  it "Should  be valid without a priority" do
    @ticket.priority_id = nil
    @ticket.should be_valid
  end
end
