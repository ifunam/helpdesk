require 'faker'

Factory.define :user do |u|
  u.email {Faker::Internet.free_email} 
  u.login "carlos"
  u.password {Faker::Internet.user_name}
  u.status true
  u.is_admin true
end


Factory.define :category do |c|
  c.name "Red inalambrica"
end

 Factory.define :status do|s|
   s.name "Nuevo"
 end

Factory.define :priority do |p|
  p.name "Normal"
end

Factory.define :ticket do |t|
   t.body {Faker::Lorem.paragraphs}
   t.association(:category, :name => "Red inalambrica")
   t.association(:status, :name => "Nuevo")
   t.association(:priority, :name => "Normal")
   t.association(:user, :login => "carlos")
end

Factory.define :invalid_ticket do |it|
  it.body {Faker::Lorem.paragraphs}
end

Factory.define :comment do |c|
  c.subject "carlos"
  c.body {Faker::Lorem.paragraphs}
  c.association(:ticket, :factory => :ticket)
end
