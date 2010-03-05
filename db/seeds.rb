User.create!(:login => 'memo' , :name =>"Guillermo Ramírez Santiago",:email => 'memo@fisica.unam.mx',:is_tech => true)

@user = User.create!(:login => 'goz',:name =>" Gustavo Gomez Macias", :email => 'goz@fisica.unam.mx',:is_tech => true)
["Paginas web del instituto", "Otro"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = User.create!(:login => 'nglez',:name =>"Neptalí González Gómez", :email => 'nglez@fisica.unam.mx',:is_tech => true)
["Red inalámbrica", "Red cableada", "Soporte para windows y sus paquetes", "Telefonía"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = User.create!(:login => 'javo',:name =>"Javier Martínez ", :email => 'javo@fisica.unam.mx',:is_tech => true)
["Correo electrónico", "Virus", "Otro", "Soporte para windows y sus paquetes" ].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = user User.create!(:login => 'javier',:name =>"Javier Martínez ", :email => 'javier@fisica.unam.mx',:is_tech => true)
["Correo electrónico", "Virus", "Otro", "Soporte para windows y sus paquetes"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = User.create!(:login => 'dulce', :name =>"Dulce Maria Aguilar Tellez", :email => 'dulce@fisica.unam.mx',:is_tech => true)
["Fotografía y carteles", "Otro", "Soporte para windows y sus paquetes"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = User.create!(:login => 'garciag',:name =>"Alberto García", :email => 'garciag@fisica.unam.mx',:is_tech => true)
["Soporte para windows y sus paquetes", "Otro"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save

@user = User.create!(:login => 'alex', :password => 'alex', :name =>"Alejandro Juárez Robles", :email => 'alex@fisica.unam.mx',:is_tech => true)
["Plataforma de Información Curricular - SALVA", "Sistema de Estudiantes Asociados - SIESTA", "Otro", "Soporte para windows y sus paquetes" ].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save


@user = User.create!(:login => 'natorro',:name =>"Carlos Ernesto López Natarén", :email => 'natorro@fisica.unam.mx',:is_tech => true)
["Sistema de Solicitudes de Servicio Técnico - HelpDesk", "Cluster brodix", "Cluster Ollin", "Supercómputo", "Laboratorio de cómputo de Sistemas Complejos",
 "Laboratorio de cómputo de Física Teórica", "Laboratorio de cómputo general de estudiantes (VAX)", "Problemas con aula 123", "Clusters Imanya y Kiral"].each do |category_name|
  @user.categories << Category.new(:name => category_name)
end
@user.save



#User.find(11).categories = [Category.find(12)]

Priority.create!(:name => "Normal")
Priority.create!(:name => "Alta" )
Priority.create!(:name => "Urgente")

Status.create!(:name => "No atendido" )

Status.create!(:name => "Atendido")
Status.create!(:name => "En Proceso")

UserCategory.create!(:user_id => 3,:category_id => 12)
UserCategory.create!(:user_id => 4,:category_id => 1)

AuthType.create!(:name => 'salva')
AuthType.create!(:name => 'db')
AuthType.create!(:name => 'ssh')

User.create!(:login => 'salma' ,:name =>"Edith Ramírez Bermudez", :email => 'salma@fisica.unam.mx',:is_tech => true, :auth_type_id => 3)
User.create!(:login => 'norma' ,:name =>"Norma Sánchez Ortega", :email => 'norma@fisica.unam.mx',:is_tech => true, :auth_type_id => 3)