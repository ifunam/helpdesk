class Schema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login,               :null => false 
      t.string    :email,               :null => false
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.boolean :status, :null => false, :default => true
      t.boolean :is_admin, :null => false, :default => false
      t.timestamps
    end
    
    User.create!(:login => 'carlos', :password => 'carlos', :password_confirmation => 'carlos', :email => 'protozoario9@hotmail.com')
    User.create!(:login => 'natorro', :password => 'natorro', :password_confirmation => 'natorro', :email => 'don_perro@hotmail.com')
    User.create!(:login => 'alex', :password => 'alex', :password_confirmation => 'alex', :email => 'jimmy_neurotic@hotmail.com')
    
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
      t.references :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
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

  end

  def self.down
    drop_table :users, :tickets, :comments, :categories, :priorities, :statuses, :user_categories, :user_types
  end
end
