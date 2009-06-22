# -*- coding: utf-8 -*-
class Views::Sessions::Index < Views::Layouts::Application
  def render_body
    div id => :sign_in do
      p "Ingresa tu nombre de usuario y contraseña:"
      #error_messages_for :user
    end
  end
end
