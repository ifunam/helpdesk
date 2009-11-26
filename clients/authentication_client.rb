require 'rubygems'
require 'activeresource'
class AuthenticationClient < ActiveResource::Base
  remote_resource = 'http://localhost:8443/'
  remote_resource = 'http://localhost:3000/' if RAILS_ENV == 'development'
  self.site = remote_resource
  self.element_name = "session"

  def self.authenticate?(login, passwd)
    if RAILS_ENV == 'development'
      User.exists?(:login => login, :password => passwd)
    else
      self.get(:login, { :login=> login, :passwd => passwd })['authentication']
    end
  end
end
