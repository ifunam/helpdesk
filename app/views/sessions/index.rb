# -*- coding: utf-8 -*-
class Views::Sessions::Index < Views::Layouts::Application
  def render_body
    div :id => :sign_in do
      text 'Ingresa tu nombre de usuario y contraseña:'
      rawtext error_messages_for(:user)
      form_for :user, @user, :url => {:action => :create} do |f|
        p do
          div :class => :td_text do
            label do
              text 'Usuario:'
            end
          end
          div :class => :td_textbox do
            rawtext f.text_field(:login)
          end
        end
        p do
          div :class => :td_text do
            label do
              text 'Contraseña:'
            end
          end
          div :class => :td_textbox do
            rawtext f.password_field(:password)
          end
        end
        p do
          rawtext submit_tag("Ingresar")
        end
      end
      if flash[:notice]
        div :class => :notice do
          rawtext flash[:notice]
        end
      end
    end
  end
end
