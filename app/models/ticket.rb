class Ticket < ActiveRecord::Base
  validates_presence_of :status_id, :category_id, :user_id
  validates_presence_of :body, :messages => "Debes introducor texto"

  belongs_to :category
  belongs_to :status
  belongs_to :priority
  belongs_to :user
  has_many :comments, :conditions => { :parent_id => nil }, :order => "created_at DESC"
  accepts_nested_attributes_for :comments
  

end
