class Ticket < ActiveRecord::Base
  validates_presence_of :status_id, :category_id, :body
  
  belongs_to :category
  belongs_to :status
  belongs_to :priority
  has_many :user_tickets
  has_many :users, :through => :user_tickets
  
  
  has_many :comments

  

end
