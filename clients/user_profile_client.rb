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

     if RAILS_ENV == 'development'
       @user= User.find_by_login(login)
       @object.attributes = {
        'adscription_id' => @user.id % 10,
        "fullname" =>@user.name,
        "phone"=>"No phone number",
        "user_id"=>@user.id,
        "adscription"=>"Técnico",
        "login"=>@user.login,
        "email"=> @user.email
      }
     else
       @object.attributes = self.get("show_by_login/#{login}")
    end
    @object
  end
  
  def self.login_exists?(login)
    @object = new
    @object.prefix_options = {}
    begin
      return true if  self.get("show_by_login/#{login}")
    rescue StandardError => bang 
      return false 
    end 
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

