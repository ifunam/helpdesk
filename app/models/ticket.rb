class Ticket < ActiveRecord::Base
  validates_presence_of :status_id, :category_id, :body
  
  

end
