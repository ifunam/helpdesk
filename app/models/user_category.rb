class UserCategory < ActiveRecord::Base
  validates_numericality_of :id, :allow_nil => true, :greater_than => 0, :only_integer => true
  validates_numericality_of :user_id, :category_id, :allow_nil => true, :greater_than => 0, :only_integer => true
  validates_uniqueness_of :category_id, :scope => [:user_id]
  
  belongs_to :user
  belongs_to :category
end
