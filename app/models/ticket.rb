# -*- coding: utf-8 -*-
class Ticket < ActiveRecord::Base
  #versioned
  validates_presence_of :status_id, :category_id#, :user_id
  validates_presence_of :body, :messages => "Debes introducor texto"

  belongs_to :category
  belongs_to :status
  belongs_to :priority
  belongs_to :user
  belongs_to :user_incharge, :class_name => 'User'


  has_many :comments, :conditions => { :parent_id => nil }
  accepts_nested_attributes_for :comments


  def self.search_and_paginate(search = :all,page = 1, per_page = 5)
    Ticket.search(search).all.paginate(:page => page, :per_page => per_page)
  end

    
  
  
end
