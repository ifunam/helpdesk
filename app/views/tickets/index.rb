# -*- coding: utf-8 -*-
class Views::Tickets::Index < Views::Layouts::Application
  def render_body
    div :id => :login do
      text 'login: '
      rawtext User.find(session[:user_id]).login
      
      rawtext link_to('Salir', session_path(:id =>session[:user_id]), :method => :delete)
    end

    div :id => 'index_title' do
      h2 do
        text 'Inicidencias reportadas por el personal del IFUNAM'
      end
    end
    div :id => 'tickets' do
      header
      
      if User.find(session[:user_id]).tickets.size == 0
        div :id => 'no_tickets' do
          text 'Por el momento no tienes solicitudes de soporte'
        end
      end
      #render_ticket
      #rawtext render(:partial => 'ticket', :collection => @tickets)
    end
    #rawtext render(:partial => 'ticket', :collection => @tickets)
  end
  # if session[:type] == 1
#     div :id => 'add_ticket' do
#       rawtext link_to('Nueva Solicitud', :action => 'new')
#     end
#   end



  def header
    div :id => :tickets_header do
      div :id => :tickets_header_panel do
        div :id => :ticket_category_h do
          text 'Categoría'
            end
            div :id => :ticket_status_h do
              text 'Estado'
        end
        div :id => :ticket_body_h do
          text 'Descripción'
        end
        div :id => :ticket_date_h do
          text 'Fecha'
        end
      end
    end
  end
end
