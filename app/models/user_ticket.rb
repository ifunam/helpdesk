class UserTicket < ActiveRecord::Base
 # validates_numericality_of :id, :allow_nil => true, :greater_than => 0, :only_integer => true
 # validates_numericality_of :user_id, :ticket_id, :allow_nil => true, :greater_than => 0, :only_integer => true
 # validates_uniqueness_of :ticket_id, :scope => [:user_id]
  
 belongs_to :user
  belongs_to :ticket
end
