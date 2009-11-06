# -*- coding: utf-8 -*-
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def controller_title
    controllers =  {
      :categories => 'Categorías',:priorities => 'Prioridades', :statuses => 'Status',
      :users => 'Usuarios', :tickets => 'Solicitudes'
    }
    controllers[controller_name.to_sym]
  end


end
