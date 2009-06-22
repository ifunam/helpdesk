class Views::Layouts::Application < Erector::Widget
  def content
    html  do
      head do
        title "STIFUNAM"
        css "application.css"
#        javascript_include_merged  :defaults
      end
      body do
        render_header
        div :id => 'main' do
          render_body
        end
      end
    end
  end



def render_header
  div :id => 'layout_header' do
    div :id => 'layout' do
      div :id => 'header' do
        "STIFUNAM"
      end
    end
  end
end

def render_body
  p "This is a ticket layout"
end
end
