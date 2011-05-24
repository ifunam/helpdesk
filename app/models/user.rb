# -*- coding: utf-8 -*-
require RAILS_ROOT + "/lib/ldap" 

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
    if User.exists?(:login => login)
	return authenticate_ldap?(login, password)
    elsif authenticate_ldap?(login, password)
        auth_type_id = UserProfileClient.login_exists?(login) ? 1 : 3
        User.create(:login => login, :password => 'qw12..', :email => login + '@fisica.unam.mx', 
                    :auth_type_id => auth_type_id, :name => login)
        return true 
    end
    return false
  end

end
