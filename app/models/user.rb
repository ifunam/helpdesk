class User < ActiveRecord::Base
  validates_presence_of :login, :password, :email
  validates_uniqueness_of :login, :email
  validates_length_of :login, :within => 3..30
  validates_format_of :login, :with => /\A[-a-z0-9\.]*\Z/
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  #validates_confirmation_of :password

  has_many :user_categories
  has_many :categories, :through => :user_categories
  has_many :tickets
  
  class << self
    def authenticate?(l,pw)
      @user = User.find_by_login(l)
      !@user.nil? and @user.password == pw ###== encrypt(pw + @user.salt.to_s)
      end
    
    
    def encrypt(string)
      Digest::SHA512.hexdigest(string)
    end
  end

  def is_admin?
    self.is_admin
  end

  def find_tickets
    if !is_admin?
      Ticket.all(:conditions => {:user_id => self.id}, :order => "created_at DESC") 
    else
      category=UserCategory.find(:first,:conditions => {:user_id => self.id}).category_id
      Ticket.all(:conditions => {:category_id => category} , :order => "created_at DESC" )
    end
  end
end
