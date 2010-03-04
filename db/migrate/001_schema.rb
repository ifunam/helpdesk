# -*- coding: utf-8 -*-
class Schema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.boolean :status, :null => false, :default => true
      t.boolean :is_tech, :null => false, :default => false
      t.string  :login, :null => false
      t.string  :email
      t.string  :password
      t.string  :name
      t.timestamps
    end

    create_table :tickets do |t|
      t.references :status, :null => false , :default => 1
      t.references :category, :null => false
      t.references :priority, :null => false, :default => 1
      t.references :user, :null => false
      t.references :user_incharge, :class_name => 'User'
      t.references :user_last_modification, :class_name => 'User'
      t.text :body, :null => false
      t.text :location_report
      t.text :location_problem
      t.timestamps
    end

    create_table :comments do |t|
      t.references :ticket
      t.references :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
      t.string :subject, :null => false
      t.references :user
      t.text :body, :null => false
      t.timestamps
    end

    create_table :categories do |t|
      t.text :name, :null => false
      t.timestamps
    end

    create_table :priorities do |t|
      t.text :name, :null => false
      t.timestamps
    end

    create_table :statuses do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :user_categories do |t|
      t.references :user, :category, :null => false
      t.timestamps
    end
  end
  def self.down
    drop_table :users, :tickets, :comments, :categories, :priorities, :statuses, :user_categories, :user_tickets
  end
end
