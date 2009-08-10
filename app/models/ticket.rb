require 'will_paginate'
class Ticket < ActiveRecord::Base
  validates_presence_of :status_id, :category_id, :user_id
  validates_presence_of :body, :messages => "Debes introducor texto"

  belongs_to :category
  belongs_to :status
  belongs_to :priority
  belongs_to :user

  default_scope :order => 'created_at DESC'
  has_many :comments, :conditions => { :parent_id => nil }
  accepts_nested_attributes_for :comments

  def self.paginate_all(page = 1, per_page = 5, order = 'DESC')
    Ticket.all(:order => "created_at #{order}" ).paginate(:page => page, :per_page => per_page)
  end
  
  def self.paginate_all_by_category_id(category_id, page=1, per_page=5, order='DESC')
    Ticket.find_all_by_category_id(category_id, :order =>  "created_at #{order}").paginate(:page => page, :per_page => per_page)
  end
end
