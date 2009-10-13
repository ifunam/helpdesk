begin
  require "rubygems"
  require "vlad"
  Vlad.load :scm => "git", :app => nil
 #Vlad.load :app => :passenger, :scm => :git 
 
# Add these lines to inject our methods: 
  require 'lib/vlad/git/submodules' 
  source.instance_eval do 
    extend Vlad::Git::Submodules 
  end 

rescue LoadError => e
  puts "Unable to load Vlad #{e}."
end

