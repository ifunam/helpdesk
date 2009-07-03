require 'faker'

Factory.define :ticket do |t|
  t.body {Faker::Lorem.paragraphs.join("\n")}
  t.category_id 1
  t.status_id 1
  t.user_id 1
  t.priority_id 1
  t.association(:category, :name => "Red inalambrica")
  t.association(:status, :name => "Nuevo")
  t.association(:priority, :name => "Normal")
  t.association(:user, :factory => :user)
end

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

Factory.define :comment do |c|
  c.subject "carlos"
  c.body "Padre"#{Faker::Lorem.paragraphs.join("\n")}
  c.association(:ticket, :factory => :ticket)
end

Factory.define :comment_child, { :class => :comment } do |c|
  c.subject "carlos"
  c.body "HIJO"#{Faker::Lorem.paragraphs.join("\n")}
  c.association(:comment, :factory => :comment )
  c.association(:ticket, :factory => :ticket)
end

Factory.define :ticket_invalid,{:class => :ticket}  do |ti| end
Factory.define :comment_invalid,{:class => :comment} do |ci| end

