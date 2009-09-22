class Comment < ActiveRecord::Base
  validates_presence_of :subject
  validates_presence_of :body
  validates_presence_of :ticket_id

  acts_as_tree
  belongs_to :ticket
  belongs_to :parent, :class_name => 'Comment', :foreign_key => 'parent_id'

  belongs_to :user
end
