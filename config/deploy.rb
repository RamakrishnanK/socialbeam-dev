set :application, "socialbeam"
 
set :scm, :git
set :repository, "git@github.com:raycoding/socialbeam-dev.git"
set :scm_passphrase, ""
set :branch, "socialbeam-aws"
set :user, "ubuntu"
set :deploy_to, "/var/www/sb-aws"
server "184.73.240.241", :app, :primary => true


 #Restart  Passenger mod_rails
#namespace :deploy do
  #task :start do ; end
 #task :stop do ; end
  #task :restart, :roles => :app, :except => { :no_release => true } do
  #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 #end
#end
