class Comment < ActiveRecord::Base
  validates_presence_of :subject, :message => "Error de subject"
  validates_presence_of :body, :message => "Error de body"

  acts_as_tree
  belongs_to :ticket
  belongs_to :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
end
