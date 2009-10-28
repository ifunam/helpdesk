require 'rubygems'
require 'activeresource'
class AuthenticationClient < ActiveResource::Base
  self.site = 'http://localhost:8443/'
  self.element_name = "session"

  def self.authenticate?(login, passwd)
    self.get(:login, { :login=> login, :passwd => passwd })['authentication']
  end
end
