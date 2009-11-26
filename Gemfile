clear_sources
source 'http://gemcutter.org'
source 'http://gems.rubyforge.org'
source 'http://gems.github.com'

bundle_path "vendor/bundler_gems"
gem 'test-unit', '1.2.3', :source => 'http://gems.rubyforge.org'
gem "rails", :version => '2.3.4' do
	directory "vendor/rails" do
		%w(activesupport activemodel actionpack actionmailer activerecord activeresource).each do |lib|
  			gem lib, :path => lib
		end
	end
end

gem 'haml', :lib => 'haml'
gem 'will_paginate', :lib => 'will_paginate'
gem 'searchlogic', :lib => 'searchlogic'
gem 'authlogic', :lib => 'authlogic'
gem 'jrails', :lib => 'jrails'
gem 'vestal_versions'
gem 'RedCloth',:lib => 'redcloth'
gem 'vlad'
gem 'vlad-git'
gem "acts_as_tree"
gem "authlogic"
# Pending
# gem "ssl_required", :git => "git://github.com/rails/ssl_requirement.git", :branch => "master"
# gem "domid_gum", :path => 'vendor/plugins/domid_gum', :git => "git://github.com/nazgum/domid_gum.git", :branch => "master"

only :development do
	'sqlite3-ruby'
end

only :test do 
	gem 'sqlite3-ruby'
	gem "shoulda"
end

only :production do 
	gem "mysql"
end
