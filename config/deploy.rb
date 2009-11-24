set :application, "help_desk"
set :user, "deployer"
set :domain, "#{ user }@garden.fisica.unam.mx"
set :deploy_to, "/var/rails/help_desk"
set :repository, "git@github.com:ifunam/helpdesk.git"
set :revision, "origin/master"

