class User < ActiveRecord::Base
  validates_length_of :login, :within => 3..30
  validates_format_of :login, :with => /\A[-a-z0-9\.]*\Z/
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/

  has_many :user_categories
  has_many :categories, :through => :user_categories
  has_many :tickets
  has_many :tickets_incharge, :class_name => 'Ticket', :foreign_key => 'user_incharge_id'
  has_one :ticket_modified, :class_name => 'Ticket',:foreign_key => 'user_last_modification_id'
  belongs_to :auth_type

  has_many :comments

  # Fix it: Refactor this piece of crap
  def profile
    if self.auth_type_id == 1
      UserProfileClient.find_by_login(login)
    else
      self
    end
  end

  def fullname
    self.name
  end 

  def adscription
     "Secretaría de Cómputo y Telecomunicaciones"
  end
  
  # Fix it: Refactor this method
  def self.authenticate?(login, password)
    if User.exists?(:login => login, :auth_type_id => 1)
      return AuthenticationClient.authenticate?(login, password)
    elsif User.exists?(:login => login, :auth_type_id => 2)
      return true unless self.find_by_login_and_password(login,password).nil?
    elsif User.exists?(:login => login, :auth_type_id => 3)
      return User.ssh_authenticate?(login, password)
    elsif User.ssh_authenticate?(login, password)
      User.create(:login => login, :password => 'qw12..', :email => login + '@fisica.unam.mx')
      return true
    end
    return false
  end

  private
  
  def self.ssh_authenticate?(login, password)
    begin
      return true if Net::SSH.start("fenix.fisica.unam.mx", login, :password => password) 
    rescue StandardError => bang
      return false
    end
  end  
end
