$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 
require "rvm/capistrano"
set :rvm_ruby_string, '1.8.7' 
set :rvm_type, :user

set :application, "helpdesk"
set :domain, "132.248.7.233"

##
# Settings
##
#load 'ext/passenger-mod-rails.rb'  # Restart task for use with mod_rails
set :deploy_to, "/var/rails/#{application}"
set :doc_dir, "/var/www/rails/#{application}_doc"
default_run_options[:pty] = true
set :use_sudo, true
set :user, "deployer"

##
# Git
##
set :repository, "git://github.com/ifunam/helpdesk.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 0

##
# Servers
##
role :web, domain
role :app, domain

namespace :deploy do
  task :create_symbolic_links, :roles => :app do

    run "ln -nfs #{deploy_to}/shared/system/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{doc_dir} #{release_path}/public/documentation"
  end
  
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "RAILS_ENV=production script/delayed_job stop"
    run "RAILS_ENV=production script/delayed_job start"
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
      desc "#{t} task is a no-op with mod_rails"
      task t, :roles => :app do ; end
  end
end

namespace :migrate do
  desc "Reset the DB by dropping it and running migrations"
  task :reset, :roles => :app do
    run "cd #{current_path} && #{sudo} rake db:migrate:reset"
  end  
end


namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && rvm use 1.8.7@helpdesk_rails_2.3.9 --passenger && bundle install"
  end
end

after 'deploy:setup', 'deploy:create_symbolic_links', 'bundler:bundle_new_release' 
