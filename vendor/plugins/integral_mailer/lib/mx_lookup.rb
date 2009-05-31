require 'resolv'

unless defined?(ActiveSupport)
  require 'rubygems'
  require 'active_support'
end

class MXLookup
  def self.reloadable?; false; end
  
  # Thanks to Dan Kubb for this method
  def self.for_domain(domain)
    return [] if domain.blank?
    
    returning Array.new do |records|
      mx_hosts = Resolv::DNS.new.getresources(domain.to_s, Resolv::DNS::Resource::IN::MX) rescue []
      mx_hosts.sort_by(&:preference).each do |mx|
        records << { :weight => mx.preference, :host => mx.exchange.to_s }
      end
      records << { :weight => (mx_hosts.collect(&:preference).max || 0) + 1, :host => domain }
    end
  end
  
  def self.for_email(email)
    return [] unless email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
    domain = email.split('@').last
    for_domain(domain)
  end
end