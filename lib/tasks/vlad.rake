begin
  require "rubygems"
  require "vlad"
  Vlad.load :scm => "git", :app => nil
rescue LoadError => e
  puts "Unable to load Vlad #{e}."
end

