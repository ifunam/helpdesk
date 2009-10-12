require 'rubygems'
require 'activeresource'
class AuthenticationClient < ActiveResource::Base
  self.site = 'http://salva.fisica.unam.mx:8080/'
  self.element_name = "session"

  def self.authenticate?(login, passwd)
    self.get(:login, { :login=> login, :passwd => passwd })['authentication']
  end
end
