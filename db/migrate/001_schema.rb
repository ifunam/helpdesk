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





    User.create!(:login => 'carlos',:name =>"Carlos Sánchez Perales" ,  :email => 'csanchez@fisica.unam.mx')
    User.create!(:login => 'memo' , :name =>"Guillermo Ramírez Santiago",:email => 'memo@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'salma' ,:name =>"Edith Ramírez Bermudez", :email => 'salma@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'goz',:name =>" Gustavo Gomez Macias", :email => 'goz@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'nglez',:name =>"Neptalí González Gómez", :email => 'nglez@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'javo',:name =>"Javier Martínez ", :email => 'javo@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'javier',:name =>"Javier Martínez ", :email => 'javier@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'dulce', :name =>"Dulce Maria Aguilar Tellez", :email => 'dulce@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'garciag',:name =>"Alberto García", :email => 'garciag@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'alex',:name =>"Alejandro Juárez Robles", :email => 'alex@fisica.unam.mx',:is_tech => true)
    User.create!(:login => 'natorro',:name =>"Carlos Ernesto López Natarén", :email => 'natorro@fisica.unam.mx',:is_tech => true)


    Category.create!(:name => "Correo electronico")
    Category.create!(:name => "Red inalambrica")
    Category.create!(:name => "Red cableada")
    Category.create!(:name => "Soporte para windows y sus paquetes")
    Category.create!(:name => "Virus")
    Category.create!(:name => "Telefonia")
    Category.create!(:name => "Paginas web del instituto")
    Category.create!(:name => "Fotografia y carteles")
    Category.create!(:name => "SALVA")
    Category.create!(:name => "SIESTA")
    Category.create!(:name => "Cluster brodix")
    Category.create!(:name => "Cluster Ollin")
    Category.create!(:name => "Supercomputo")
    Category.create!(:name => "Laboratorio de cómputo de Sistemas Complejos")
    Category.create!(:name => "Laboratorio de cómputo de Física Teórica")
    Category.create!(:name => "Laboratorio de cómputo general de estudiantes (VAX)")
    Category.create!(:name => "Otro")

    Priority.create!(:name => "Normal")
    Priority.create!(:name => "Alta" )
    Priority.create!(:name => "Urgente")

    Status.create!(:name => "No atendido" )

    Status.create!(:name => "Atendido")
    Status.create!(:name => "En Proceso")

    UserCategory.create!(:user_id => 3,:category_id => 12)
    UserCategory.create!(:user_id => 4,:category_id => 1)


  end
  def self.down
    drop_table :users, :tickets, :comments, :categories, :priorities, :statuses, :user_categories, :user_tickets
  end
end
