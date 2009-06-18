# user_profile_cliente_spec.rb

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserProfileClient do 
  before(:each) do 
    @user_profile = UserProfileClient.find_by_login("natorro")
  end

 it "should have fullname" do
   @user_profile.fullname.should eql('López Natarén Carlos Ernesto')
 end
 
 it "should have an adscription name" do
   @user_profile.adscription.should eql('Apoyo')
 end

 it "should have an adscription id" do
   @user_profile.adscription_id.should eql(7)
 end
 
 it "should have a remote user id" do
   @user_profile.remote_user_id.should eql(182)
 end
 
 it "should have a phone number" do
   @user_profile.phone.should eql("56225001")
 end
 
 it "should have an email" do
   @user_profile.email.should eql('natorro@fisica.unam.mx')
 end
 
 it "should have a login" do
   @user_profile.login.should eql('natorro')
 end
 
 it "should have user in charge" do
   @user_profile.has_user_incharge?.should eql(true)
 end
 
 it "should return a user in charge" do
   @user_profile.user_incharge.should be_a_kind_of(UserProfileClient)
 end
 
 end
  
  