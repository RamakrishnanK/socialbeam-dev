# Social Network Development Project in Rails - SOCIALBEAM

Socialbeam is a Open Source Development Project for building a Social Network. In its early stages of development phase Socialbeam aims to implement
the primary set of features that a Social Network consists of. Written in simle lucid design styles and explained briefly the structure of the platform Socialbeam hopefully will implement most if not all social network features that we see around presently. As the 'Social' evolves with time so will this project Socialbeam.

## Features implemented and will be implemented
1. User Base (Beamers)
2. Messaging System
3. User Network and Aspects
4. Activity Streams
5. Groups and Pages
6. Events
7. Aspects Sharing
8. Digital Albums
(this stack will increase in size definitely with time as Socialbeam percieves more features.
 
### You can also follow the [Socialbeam Development Tutorials](http://raycoding.net/category/ruby-on-rails/socialbeam-development-tutorial/)

If you need guide starting up with Ruby on Rails 
* [Getting Started](http://guides.rubyonrails.org/getting_started.html)
* [Ruby on Rails Tutorial](http://www.railstutorial.org/)

### Configuration
Socialbeam is running on RVM with Ruby Enterprize Edition REE 1.8.7 and Rails 3.2.8,MySQL, Apache2 - Passenger Rails
I would suggest you to get your system setup from the instructions of system setup below.

## Guide to SetUp System and Run Socialbeam
* Make your project directory and clone the branch(master), enter project directory
* Source into bash the setup Script file under **./setup/setup_socialbeam.sh**
* execute "source ./setup/setup_socialbeam.sh"
* execute "setup_stuffs"
         	
 		  
                        function install_jdk
			{
			    #Download and place jdk-6u29-linux-i586.bin from your Oracle Downloads in your /usr/lib/jvm folder
			    cd /usr/lib/jvm
			    sudo chmod +x jdk-6u29-linux-i586.bin
			    sudo ./jdk-6u29-linux-i586.bin
			  
			    #After the installation is done
			    #Put this in your /etc/bash.bashrc
			    #export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29
			    #export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre
			  
			}
			  
			function apt_get_stuff
			{
			    #dev tools
			    sudo apt-get install build-essential bison openssl libreadline5 libreadline-dev curl git zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev
			    # imagemagick
			    sudo apt-get install imagemagick
			    #memcache
			    sudo apt-get install memcached
			    #Java
			    sudo add-apt-repository "deb http://archive.canonical.com/  lucid partner"
			    sudo apt-get update
			    install_jdk  
			    #git and svn
			    sudo apt-get install git-core subversion
			}
			  
			function install_rvm_ree
			{
			    echo "installing rvm"
			    \curl -L https://get.rvm.io | bash -s stable
			    rvm install ree
			    rvm --default use ree
			}
			  
			  
			function rails_setup
			{
			    rvm gemset create rails3
			    rvm use ree-1.8.7@rails3 
			    #please note at time of installing the version of rvm was 1.8.7,please make changes if needed
			    gem install rails -v=3.2.8
			    rvm use ree-1.8.7@rails3 --default
			    
			}
			  
			  
			function mysql_setup
			{
			    sudo apt-get install libmysqlclient-dev 
			    gem install mysql
			    sudo apt-get install mysql-server-5.1
			}
			  
			  
			function apache_setup
			{
			    sudo apt-get install apache2 apache2-mpm-prefork apache2-prefork-dev
			}
			
			function passenger_rails
			{
			   gem install passenger
			   passenger-install-apache2-module
			    
			}
			
			  
			  
			function setup_stuffs
			{
			  apt_get_stuff
			  install_rvm_ree
			  rails_setup
			  mysql_setup
			  apache_setup
			  passenger_rails
			}

   
   **(You can also get the Script from the codebase under directory setup/setup_socialbeam.sh)**
* Open terminal and run `source setup_socialbeam.sh`
* run `setup_stuffs`
* On installing Passenger Rails from the above steps you will be asked to add three lines to apache2.conf file, 
please add those three lines for proper configuration of Passenger Rails with Apache2. 
The lines will be something like these.
*      __LoadModule passenger_module /home/username/.rvm/gems/ree-1.8.7-2012.02@rails3/gems/passenger-3.0.18/ext/apache2/mod_passenger.so__
*      __PassengerRoot /home/username/.rvm/gems/ree-1.8.7-2012.02@rails3/gems/passenger-3.0.18__
*      __PassengerRuby /home/username/.rvm/wrappers/ree-1.8.7-2012.02@rails3/ruby__
      Copy the three lines generated on your system into your /etc/apache2/apache2.conf
* `sudo a2enmod rewrite`
* Add the below lines to a new sites-available file `sudo vim /etc/apache2/sites-available/dev.socialbeam.com`
     	`<VirtualHost *:80>`
	`(Change these lines to suit your project path)`
	`RailsEnv development`
	`ServerName dev.socialbeam.com`
	`DocumentRoot /home/user/Work/code/SocialbeamProject/socialbeam/public`
	`</VirtualHost>`
* Open `sudo vim /etc/hosts` and add **127.0.0.1   dev.socialbeam.com**
* `sudo a2ensite dev.socialbeam.com`
* `sudo service apache2 restart`

> **Finally open dev.socialbeam.com , if everything ran fine till here then you should be able to see the Home Page of Socialbeam.**
      

## Step By Step Development Tutorials
1. [System Setup](http://raycoding.net/2012/10/17/creating-social-network-on-ruby-on-rails-day-1/)
2. [Project Setup](http://raycoding.net/2012/10/26/creating-social-network-on-ruby-on-rails-day-2/)
3. [Twitter Bootstrap and Styles](http://raycoding.net/2012/10/26/creating-social-network-on-ruby-on-rails-day-3-adding-navigations-and-stylesheets/)
4. [User MVC](http://raycoding.net/2012/10/29/creating-social-network-on-ruby-on-rails-day-4-socialbeams-user-mvc/)
5. [Navigations,jQuery,Bootstrap Part 2](http://raycoding.net/2012/10/30/creating-social-network-on-ruby-on-rails-day-5-navigationstwitter-bootstrap-stylesjquery-part-2/)
6. [Dynamic Activity Wall with AJAX-jQuery](http://raycoding.net/2012/11/01/creating-social-network-on-ruby-on-rails-day-6-dynamic-facebook-like-wall-with-rails-ajax-jquery/)
7. [Setting up Apache2+Passenger+Rails](http://raycoding.net/2012/12/22/creating-social-network-on-ruby-on-rails-day-7-setting-up-rails-apache-with-passenger/)
8. [Source Control](http://raycoding.net/2012/12/22/creating-social-network-on-ruby-on-rails-day-8-source-control-on-git/)
9. [User Profile Part 1](http://raycoding.net/2012/12/28/creating-social-network-on-ruby-on-rails-day-9-creating-user-profile-part-1/)
10.[Messaging System in Socialbeam](http://raycoding.net/2013/01/05/creating-social-network-on-ruby-on-rails-day-10-creating-messaging-system-init/)


## Environment on Rails
####Console
> The console is a Ruby shell, which allows you to interact with your
application's domain model. Here you'll have all parts of the application
configured, just like it is when the application is running. You can inspect
domain models, change values, and save to the database. Starting the script
without arguments will launch it in the development environment.
To start the console, run 'rails console' from the Socialbeam's application
directory.It often happens while your console is loaded you make changes to your MVC,so to reload your controllers and models after launching the console run
reload!

####dbconsole
> You can go to the command line of your database directly through rails
dbconsole. You would be connected to the database with the credentials
defined in - Socialbeam's database.yml. Starting the script without arguments will connect you
to the development database.

####Directory Architechture of SocialBeam App:

app
> Holds all the code that's specific to this particular application.

app/assets
> Contains subdirectories for images, stylesheets, and JavaScript files.

app/controllers
> Holds controllers that should be named like weblogs_controller.rb for
  automated URL mapping. All controllers should descend from
  ApplicationController which itself descends from ActionController::Base.

app/models
> Holds models that should be named like post.rb. Models descend from
  ActiveRecord::Base by default.

app/views
> Holds the template files for the view that should be named like
  weblogs/index.html.erb for the WeblogsController#index action. All views use
  eRuby syntax by default.

app/views/layouts
> Holds the template files for layouts to be used with views. This models the
  common header/footer method of wrapping views. In your views, define a layout
  using the <tt>layout :default</tt> and create a file named default.html.erb.
  Inside default.html.erb, call <% yield %> to render the view using this
  layout.

app/helpers
> Holds view helpers that should be named like weblogs_helper.rb. These are
  generated for you automatically when using generators for controllers.
  Helpers can be used to wrap functionality for your views into methods.

config
> Configuration files for the Rails environment, the routing map, the database,
  and other dependencies.

db
> Contains the database schema in schema.rb. db/migrate contains all the
  sequence of Migrations for your schema.

doc
> This directory is where your application documentation will be stored when
  generated using <tt>rake doc:app</tt>

lib
> Application specific libraries. Basically, any kind of custom code that
  doesn't belong under controllers, models, or helpers. This directory is in
  the load path.

public
> The directory available for the web server. Also contains the dispatchers and the
  default HTML files. This should be set as the DOCUMENT_ROOT of your web
  server.

script
> Helper scripts for automation and generation.

test
> Unit and functional tests along with fixtures. When using the rails generate
  command, template test files will be generated for you and placed in this
  directory.

vendor
> External libraries that the application depends on. Also includes the plugins
  subdirectory. If the app has frozen rails, those gems also go here, under
  vendor/rails/. This directory is in the load path.

**Tutorial on www.raycoding.net for more details.**
