class User < ActiveRecord::Base
  #acts_as_authentic


  validates_length_of :login, :within => 3..30
  validates_format_of :login, :with => /\A[-a-z0-9\.]*\Z/
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  #validates_confirmation_of :password

  has_many :user_categories
  has_many :categories, :through => :user_categories
  has_many :tickets
  has_many :tickets_incharge, :class_name => 'Ticket', :foreign_key => 'user_incharge_id'
  has_one :ticket_modified, :class_name => 'Ticket',:foreign_key => 'user_last_modification_id'
  belongs_to :auth_type

  has_many :comments


  def profile
    UserProfileClient.find_by_login(login)
  end

  # Fix it: Refactor this method
  def self.authenticate?(login, password)
    if User.exist?(:login => login, :auth_type_id => 1)
      return AuthenticationClient.authenticate?(login, password)
    elsif User.exist?(:login => login, :auth_type_id => 2)
      return true unless self.find(:login => login, :password => password).nil?
    elsif User.exist?(:login => login, :auth_type_id => 3)
      return ssh_authenticate?(login, password)
    end
    return false
  end

  private
  
  def ssh_authenticate?(login, password)
    begin
      return true if Net::SSH.start("fenix.fisica.unam.mx", login, :password => password) 
    rescue StandardError => bang
      return false
    end
  end  
end
