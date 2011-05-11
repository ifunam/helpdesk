require 'rubygems'
require 'net-ldap'

def ldap_config
   YAML.load(ERB.new(File.read(RAILS_ROOT  + "/config/ldap.yml")).result)['production']
end

def ldap
  Net::LDAP.new(:host => ldap_config['host'], :port => ldap_config['port'], :encryption => (ldap_config['ssl'] ? :simple_tls : nil),
                    :auth => { :method => :simple, :username => ldap_config['admin_user'], :password => ldap_config['admin_password'] })
end

def dn(login)
    ldap.search(:base => ldap_config['base'], :filter => Net::LDAP::Filter.eq("uid", login), :return_result => true ).first.dn
end

def authenticate_ldap?(login, password)
   @ldap = ldap
   @ldap.auth(dn(login), password)
   @ldap.bind
end

