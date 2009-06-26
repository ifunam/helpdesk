# -*- coding: utf-8 -*-
class Views::Sessions::Signout < Views::Layouts::Application
  def render_body
    div :id => :signout do
      text 'Su sesión ha terminado.'
      br
      text 'Gracias por usar el STIFUNAM.'
    end
    div :id => :back_to_login do
      text 'Si desea entrar al sistema de nueva ocasión, presione'
#      rawtext link_to("aquí", session_url)
      
    end
  end
end
