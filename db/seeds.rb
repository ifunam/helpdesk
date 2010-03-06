User.create!(:login => 'memo' , :name =>"Guillermo Ramírez Santiago",:email => 'memo@fisica.unam.mx',:is_tech => true)
User.create!(:login => 'salma' ,:name =>"Edith Ramírez Bermudez", :email => 'salma@fisica.unam.mx',:is_tech => true, :auth_type_id => 3)
User.create!(:login => 'norma' ,:name =>"Norma Sánchez Ortega", :email => 'norma@fisica.unam.mx',:is_tech => true, :auth_type_id => 3)

def category_find_or_create(category_name)
  Category.exists?(:name => category_name) ? Category.find_by_name(category_name) : Category.create!(:name => category_name)
end

[
 { :user => { :login => 'goz',:name =>" Gustavo Gomez Macias", :email => 'goz@fisica.unam.mx', :is_tech => true },
   :categories => ["Paginas web del instituto", "Otro"]
 },
 { :user => { :login => 'nglez',:name =>"Neptalí González Gómez", :email => 'nglez@fisica.unam.mx', :is_tech => true },
   :categories => ["Otro", "Red inalámbrica", "Red cableada", "Soporte para windows y sus paquetes", "Telefonía"]
 },
 { :user => { :login => 'javo',:name =>"Javier Martínez ", :email => 'javo@fisica.unam.mx', :is_tech => true },
   :categories => ["Correo electrónico", "Virus", "Otro", "Soporte para windows y sus paquetes", "Seguridad" ]
 },
 { :user => { :login => 'javier',:name =>"Javier Martínez ", :email => 'javier@fisica.unam.mx', :is_tech => true },
   :categories => ["Correo electrónico", "Virus", "Otro", "Soporte para windows y sus paquetes", "Seguridad" ]
 },
 { :user => { :login => 'dulce', :name =>"Dulce Maria Aguilar Tellez", :email => 'dulce@fisica.unam.mx', :is_tech => true },
   :categories => ["Fotografía y carteles", "Otro", "Soporte para windows y sus paquetes"]
 },
 { :user => { :login => 'garciag', :name =>"Alberto García", :email => 'garciag@fisica.unam.mx', :is_tech => true },
   :categories => ["Soporte para windows y sus paquetes", "Otro"]
 },
 { :user => { :login => 'alex', :name =>"Alejandro Juárez Robles", :email => 'alex@fisica.unam.mx', :is_tech => true },
   :categories => ["Plataforma de Información Curricular - SALVA", "Sistema de Estudiantes Asociados - SIESTA", "Desarrollo de sistemas", "Soporte para windows y sus paquetes", "Otro"]
 },
 { :user => { :login => 'natorro', :name => "Carlos Ernesto López Natarén", :email => 'natorro@fisica.unam.mx', :is_tech => true },
   :categories => ["Sistema de Solicitudes de Servicio Técnico - HelpDesk", "Cluster brodix", "Cluster Ollin", "Supercómputo", "Laboratorio de cómputo de Sistemas Complejos", "Laboratorio de cómputo de Física Teórica", "Laboratorio de cómputo general de estudiantes (VAX)", "Problemas con aula 123", "Clusters Imanya y Kiral"]
 },
].each do |h|
  @user = User.new(h[:user])
  h[:categories].each do |category_name|
    @user.categories << category_find_or_create(category_name)
  end
  @user.save
end

Priority.create!(:name => "Normal")
Priority.create!(:name => "Alta" )
Priority.create!(:name => "Urgente")

Status.create!(:name => "No atendido" )
Status.create!(:name => "Atendido")
Status.create!(:name => "En Proceso")

AuthType.create!(:name => 'salva')
AuthType.create!(:name => 'db')
AuthType.create!(:name => 'ssh')
