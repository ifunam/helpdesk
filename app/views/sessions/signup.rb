class Signup < Erector::Widget
  def content
    h1 do
      text 'Session#signup'
    end
    p do
      text 'Find me in app/views/session/signup.html.erb'
    end
  end
end
