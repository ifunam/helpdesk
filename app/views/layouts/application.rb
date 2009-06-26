class Views::Layouts::Application < Erector::RailsWidget
  def content
    # rawtext '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
# "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
    html :xmlns => 'http://www.w3.org/1999/xhtml', 'xml:lang' => 'en', :lang => 'en' do
      head do
        meta 'http-equiv' => 'content-type', :content => 'text/html;charset=UTF-8'
        title do
          text 'Stifunam'
        end
        stylesheet_link_tag 'application'
        javascript_include_tag :defaults
      end
      
      
      body do
        render_header
        div :id => :main do
          render_body 
        end
      end
    end
  end

  def render_body
    p "This is a ticket layout"
  end

  def render_header
    div :id => :layout_header do
      div :id => :layout do
        div :id => :header do
          h1 :id => :logo do
            text 'STIFUNAM'
          end
        end
          end
      div :id => :logo_unam do
        rawtext image_tag("logo_unam2.jpg")
      end
    end
  end

end
 
