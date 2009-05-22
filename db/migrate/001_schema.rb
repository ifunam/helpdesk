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
      t.references :status, :null => false 
      t.references :category, :null => false
      t.references :priority, :null => false
      t.text :body, :null => false
      t.timestamps
    end
    
    create_table :comments do |t|
      t.references :ticket
      #t.references :parent, :class_name => 'Comment', :foreign_key => 'parent_id'
      t.string :subject
      t.text :body
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

    create_table :user_tickets do |t|
      t.references :user, :ticket, :null => false
      t.timestamps
    end


    [ 'Correo electrónico',
      'Red inalámbrica',
      'Red cableada',
      'Soporte para windows y sus paquetes',
      'Virus!',
      'Telefonía',
      'Páginas web del instituto',
      'Fotografía y carteles',
      'SALVA',
      'SIESTA',
      'Cluster Brodix',
      'Cluster Ollín',
      'Supercómputo',
      'Laboratorio de cómputo de Sistemas Complejos',
      'Laboratorio de cómputo de Física Teórica',
      'Laboratorio de cómputo general de estudiantes (VAX)',
      'Problemas conmigo mismo y con mis colegas',
      'Otro'].each do |name|
        Category.create(:name => name)
      end
    
    ['Alta', 'Normal', 'Baja'].each do |name|
      Priority.create(:name => name)
    end
    
    ['En proceso', 'Cerrado', 'Cancelado', 'Duplicado','Pendiente'].each do |name|
      Status.create(:name => name)
    end
    #A normal user
    User.create(:login => "carlos",:password => "carlos", :email => "protozoario9@hotmail.com")
    
  end

  def self.down
    drop_table :users, :tickets, :comments, :categories, :priorities, :statuses, :user_categories, :user_tickets
  end
end
