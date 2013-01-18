#Deployment Server is running on the following most important platforms
#RVM (rvm 1.17.9)
#Rails(3.2.11)
#Ruby (ruby 1.9.2p320)
#Capistrano (capistrano (2.14.1)\
#RVM-Capistrano (rvm-capistrano (1.2.7))
#Phusion Passenger version 3.0.19
#Apache/2.2.20
#For more details on RVM -Capistrano integration see here https://rvm.io/integration/capistrano/
 #Make sure to install 'rvm-capistrano' in deployment server before 

set :rvm_ruby_string, '1.9.2'  #global in deployment server
set :rvm_type, :system #system-wide RVM installation in server
require "rvm/capistrano"
set :application, "socialbeam"
set :scm, :git
set :repository, "git@github.com:raycoding/socialbeam-dev.git"
set :scm_passphrase, ""
set :branch, "socialbeam-aws"
set :user, "ubuntu"
set :deploy_to, "/var/www/socialbeam-production"
set :rails_env, "production"


set :domain,ENV['EC2_SERVER_URL']
role :app, domain
role :web, domain
role :db, domain, :primary => true
server ENV['EC2_SERVER_URL'], :app, :roles=>:db,:primary => true

#Cleaning up older releases > 5
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup" 
#Running Migrations after deployment
after 'deploy:update_code', 'deploy:migrate'


#restart  Passenger mod_rails
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
  run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end
