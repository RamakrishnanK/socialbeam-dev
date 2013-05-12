# PROJECT HAS MIGRATED/MOVED/CONTINUED/SHIFTED TO [palBuddy](https://github.com/raycoding/palbuddy)

# Social Network Development Project in Rails - SOCIALBEAM![Socialbeam](https://s3.amazonaws.com/socialbeam-repo/images/sb_large.png "Socialbeam")
Socialbeam is a Open Source Development Project for building a Social Network. In its early stages of development phase Socialbeam aims to implement
the primary set of features that a Social Network consists of. The structure of the platform Socialbeam hopefully will implement most if not all social network features that we see around presently. 
Socialbeam is concurrently developed on localbox running Ubuntu 11.10 and deployed simultaneously on Amazon EC2 Instance Server Box. Please find below the guide to setup 
both localbox. Instructions for setting up on Amazon EC2 will be detailed out in future.

## Features implemented
1. User Base (Beamers - Registration and Authentication using Authlogic,Nodes on GraphDB and SQLDB)
2. Messaging System
3. Social Wall Stream(Public Stream)
4. News Feeds Systems(Public Notifications)
5. Comment and Like/Dislike on Post/Comments
6. Friendship (Request,Pending,Accept-Reject Model,Nodes on GraphDB and SQLDB) 

##Features under development
1. Groups - Public and Private
2. User Profile
3. Email System
4. WorldWide News Board based on Interests
5. Pages
6. Events
7. Topics,Tags Cloud and Trends
 
### Socialbeam Step by Step Development Tutorial 
* Look here [Socialbeam Development Tutorials](http://raycoding.net/category/ruby-on-rails/socialbeam-development-tutorial/)

### Configuration
* Primary Ingredients of Socialbeam -  RVM with jRuby 1.6.8 (Ruby - 1.9.2),Rails 3.2.11,JDBC-MySQL, Apache2 - Passenger Rails,Capistrano,Neo4j+Neography, Authlogic

### For more details about important parts used for Project
* About Ruby on Rails [Getting Started](http://guides.rubyonrails.org/getting_started.html) and 
* About [RVM and Rubies Installation read here](https://rvm.io/rvm/install/) 
* About [Passenger Mod Rails and Apache2 Module](http://www.modrails.com/documentation/Users%20guide%20Apache.html) and and [RVM with Passenger read here](https://rvm.io/integration/passenger/)
* About Deployment with [Capistrano read here](https://github.com/capistrano/capistrano/wiki) and [RVM-Capistrano read here](https://github.com/wayneeseguin/rvm-capistrano)
* About [Using RVM with Capistrano read here](https://rvm.io/integration/capistrano/)
* About [JRUBY read here](https://github.com/jruby/jruby)
* About [Neo4j Rails read here](https://github.com/andreasronge/neo4j)
* About [Neography API for Neo4j Rails read here](https://github.com/maxdemarzi/neography)
* About [Authlogic read here](https://github.com/binarylogic/authlogic)


## Guide to setUp System on Localbox

### Local System Setup
* Clone the project into some direcrtory you want on your system.
* From the console enter the APP directory and if you `ls` APP directory you will find a folder named `setup`. In that folder there is a script named `install_socialbeam.sh`
* Executing this Script with appropriate argument would install Socialbeam with System Setup for both local box and Amazon EC2 Instance
* Give execute permission to the Script, from the APP directory, execute `chmod u+rwx ./setup/install_socialbeam.sh`
* Once the execute permission is set execute `./setup/install_socialbeam.sh localbox`
* Sit back as the installation script will process and get everything needed on your localbox for Socialbeam to run
* After installation finishes enter APP directory and do a "bundle install" to install all gems dependencies from Gemfile
* You now need to install neo4j
* Install Neo4J Server and Executables,Execute commands from APP directory: `rake neo4j:install` and `rake neo4j:start`
* Useful Neo4J Commands
* Commands for Neo4j
  1. rake neo4j:install # Install Neo4j to the neo4j directory under your project
  2. rake neo4j:install[community,1.6.M03] # Install Neo4j Community edition, version 1.6.M03
  3. rake neo4j:start # Start Neo4j
  4. rake neo4j:stop  # Stop Neo4j
  5. rake neo4j:restart # Restart Neo4j
  6. rake neo4j:reset_yes_i_am_sure # Wipe your Neo4j Database

###Running Socialbeam on localbox 
* There two ways you can run Socialbeam on your local box

  1. Running with default WebRick Server provided by Rails
          * Migrate into the APP directory and make sure you ran rake db:create and rake db:migrate before executing `rails server -p 3333`.
          * You should be able to see Socialbeam running on localhost:3333/ or whichever port you choose to pass
  2. Running with Apache2 Server - Setting up virtual host
	  * Enable Apache2 Rewrites - execute `sudo a2enmod rewrite`
	  * Add the below lines to a new sites-available file `sudo vim /etc/apache2/sites-available/dev.socialbeam.com`
		1. `<VirtualHost *:80>`
		2. `(Change these lines to suit your project path)`
		3. `RailsEnv development`
		4. `ServerName dev.socialbeam.com`
		5. `DocumentRoot /APP DIRECTORY PATH/public`
		6. `</VirtualHost>`
	  * Add site to hosts - execute `sudo vim /etc/hosts` and add **127.0.0.1   dev.socialbeam.com**
	  * Add our new virtual Site to enabled sites - execute `sudo a2ensite dev.socialbeam.com`
	  * Restart Apache - execute `sudo service apache2 restart`

> **On localbox open dev.socialbeam.com , if everything installed fine then you should be able to see the Home Page of Socialbeam in your local box at dev.socialbeam.com**
      

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
10. [Messaging System in Socialbeam](http://raycoding.net/2013/01/05/creating-social-network-on-ruby-on-rails-day-10-creating-messaging-system-init/)

**Tutorial on www.raycoding.net for more details.**
