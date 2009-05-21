class Comment < ActiveRecord::Base
   validates_presence_of :subject, :body
  
   belongs_to :ticket
   #belongs_to :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
end
