class Schema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :password, :email, :twitter, :salt
      t.boolean :status, :null => false, :default => true
      t.boolean :is_admin, :null => false, :default => false
      t.timestamps
    end

    create_table :tickets do |t|
      t.references :status, :null => false , :default => 1
      t.references :category, :null => false
      t.references :priority, :null => false, :default => 1
      t.references :user, :null => false
      t.text :body, :null => false
      t.timestamps
    end
    
    create_table :comments do |t|
      t.references :ticket
      #t.references :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
      t.string :subject, :null => false
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

   

    create_table :user_types do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :permissions do |t|
      t.references :user_type, :null => false
      t.string :name
      t.string :controler, :default => "tickets"
      t.text :action, :null => false
      t.text :method, :default => "get"
      t.string :view
      t.string :icon, :default => ".."
      t.text :title, :null => false
      t.text :message
      t.string :id_tag, :default => "id"
      t.timestamps
    end
     
    
    
    
  end

  def self.down
    drop_table :users, :tickets, :comments, :categories, :priorities, :statuses, :user_categories, :user_types, :peermissions
  end
end
