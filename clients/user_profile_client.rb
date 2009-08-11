# -*- coding: utf-8 -*-
require 'rubygems'
require 'activeresource'
class UserProfileClient < ActiveResource::Base
  self.site = 'http://salva.fisica.unam.mx:8080/'
  self.element_name = "academic"
 
  def self.find_by_login(login)
    # Fix it: use this code only for develoment
    @object = new
    @object.prefix_options = {}
    if ENV['RAILS_ENV'] == 'development' and (login == 'carlos'or login == 'juan')
      if login == 'carlos'
        @object.attributes = {  'adscription_id' => 7,
          "fullname" =>"Carlos Sánches Perales", 
          "phone"=>"56225001 ext 289", 
          "user_id"=>167, 
          "adscription"=>"Apoyo", 
          "login"=>"carlos", 
          "email"=> "carlos@fisica.unam.mx"
        }
      else
        @object.attributes = {  'adscription_id' => 8,
          "fullname" =>"Juan López López", 
          "phone"=>"56225001 ext 289", 
          "user_id"=>168, 
          "adscription"=>"Apoyo", 
          "login"=>"juan", 
        }
      end

    else
      @object.attributes = self.get("show_by_login/#{login}")
    end
    @object
  end
 
  def self.find_by_user_id(id)
     self.find(id)
  end
 
  def fullname
    @attributes['fullname']
  end
 
  def adscription_name
    @attributes['adscription']
  end
 
  def adscription_id
    @attributes['adscription_id']
  end
 
  def remote_user_id
    @attributes['user_id']
  end
 
  def phone
    @attributes['phone']
  end
 
  def email
    @attributes['email']
  end
 
  def login
    @attributes['login']
  end
 
  def has_user_incharge?
    !@attributes['user_incharge_id'].nil?
  end
 
  def user_incharge
    UserProfileClient.find_by_user_id(@attributes['user_incharge_id']) if has_user_incharge?
  end
end
 
