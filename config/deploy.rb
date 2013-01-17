set :rvm_ruby_string, '1.9.2@rails311.1.9.2'
set :rvm_type, :user

set :application, "socialbeam"
set :scm, :git
set :repository, "git@github.com:raycoding/socialbeam-dev.git"
set :scm_passphrase, ""
set :branch, "socialbeam-aws"
set :user, "ubuntu"
set :deploy_to, "/var/www/socialbeam-production"
set :rails_env, "production"


set :domain, '184.73.240.241'
role :app, domain
role :web, domain
role :db, domain, :primary => true
server "184.73.240.241", :app, :roles=>:db,:primary => true

#Cleaning up older releases > 5
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup" 
#Running Migrations after deployment
after 'deploy:update_code', 'deploy:migrate'


#Restart  Passenger mod_rails
#namespace :deploy do
#  task :start do ; end
# task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#  run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 #end
#end
