# Social Network Development Project in Rails - SOCIALBEAM

Socialbeam is a Open Source Development Project for building a Social Network. In its early stages of development phase Socialbeam aims to implement
the primary set of features that a Social Network consists of. Written in simle lucid design styles and explained briefly the structure of the platform Socialbeam hopefully will implement most if not all social network features that we see around presently. 
As the 'Social' evolves with time so will this project Socialbeam. Socialbeam is concurrently developed on localbox running Ubuntu 11.10 with all setup and Amazon EC2 Box too. Please find below the guide to setup 
both localbox and also an Amazon EC2 Instance Server if you have one. The reason why deployment is concurrent in both local and server becuase it helps me understands the server management and load better and therfore build the system accordingly.

## Features implemented
1. User Base (Beamers)
2. Messaging System
3. Social Wall Stream
4. News Feeds
5. Comment and Likes System on Stream
(this stack will increase in size definitely with time as Socialbeam percieves more features.

##Features under development
1. Groups
2. User Profile
3. Email
4. WorldWide News Board
5. Pages
6. Events
 
### You can also follow the [Socialbeam Development Tutorials](http://raycoding.net/category/ruby-on-rails/socialbeam-development-tutorial/)

If you need guide starting up with Ruby on Rails 
* [Getting Started](http://guides.rubyonrails.org/getting_started.html)
* [Ruby on Rails Tutorial](http://www.railstutorial.org/)

### Configuration
Socialbeam is running on RVM with Ruby Enterprize Edition REE 1.8.7 and Rails 3.2.8,MySQL, Apache2 - Passenger Rails
I would suggest you to get your system setup from the instructions of system setup below.

## Guide to SetUp System on Local System and also in Amazon EC2 Instance(if you have one)

### Local System Setup
* Clone the project into some direcrtory you want on your system.
* From the console enter the app directory and you will find a folder named "setup"
* In that folder there is a script named install_socialbeam.sh
* Executing this Script with an argument can install Socialbeam with System Setup for both local box and Amazon EC2 Instance
* In colsole 'cd' to the setup directory and execute 'source ./install_socialbeam.sh'
* Now once you have sourced the script all you need to execute is "setup localbox"
* Sit back and relax as the Script will install everything you need on your localbox"

### Amazon EC2 Instance Setup
* If you alread have an Amazon EC2 Instance running on Ubuntu 11.10 64Bit then the please read the following lines to get your system running on EC2
* ssh into your EC2 instance with default user 'ubuntu' provided by Amazon for EC2 instances
* cd /var/www/
* execute 'sudo chown -R ubuntu ./'
* execute 'sudo chgrp -R ubuntu ./'
* The previous two lines are important as we need to own the www directory for user 'ubuntu' where we are going to deploy our App
* Now copy the contents of install_socialbeam.sh and paste into some file on your server probably giving it the same name install_socialbeam.sh
* In colsole 'cd' to the directory where you created the file and execute 'source ./install_socialbeam.sh'
* Once sourced execute "setup amazonbox"
* Now this installation is a two way step as you will notice as unlike local box we want to install RVM and RUBY and RAILS and every other thing SYSTEMWIDE
* So Step One of this installation will install RVM systemwide and create a group named "rvm" in /etc/group
* Open up /etc/group and right at the end you will find the group named "rvm" , after the colon(:) add root,ubuntu to it
* Just enter after the colon root,ubutu. Similarly right the top is the group named root added ubuntu to it. What we do here is add both root and ubutu Users to RVM group and add ubunut User to Root Group
* Now you can log out and ssh login back again.
* Once again "source install_socialbeam.sh" and execute "setup amazonbox" - This time you will notice it will be Step Two of the Installation.
* Wait for the installation to finish
* Once installation is over logout and in your local box enter the app directory
* There you will find a script under config folder named deploy.rb
* Open the Script "deploy.rb" , there you will find an IP, ofcourse you would have replace that IP with the Elastic IP of your Amazon EC2 Instance
* After modifying the IP save the file and from app directory in console run "cap deploy:setup"
* Once "cap deploy:setup" is complete run "cap deploy"
* Sit back and enjoy as the deployment completes.
(Please note I have considered you the added the ssh keys in your Server to access GIT, else cap deploy won't work)


### NOTE for both local box and Amazon EC2 Setup
* In both setups there is a part where Apache2 Module for Passenger is installed,during installation Passenger will promt you to copy three lines.
* The lines will be something like these.
     __LoadModule passenger_module ....text__
     __PassengerRoot ....text__
     __PassengerRuby ....text__
* Make sure to copy the rthree lines generated while installation is goin on becuase they won't be generated again.
* Once installation finished copy the lines which is now in clipboard memory into your /etc/apache2/apache2.conf

### Virtual Host Setup in Localbox
Once these lines the copied to apache2.conf go forward with creating virtual host on localbox
* `sudo a2enmod rewrite`
* Add the below lines to a new sites-available file `sudo vim /etc/apache2/sites-available/dev.socialbeam.com`
     	`<VirtualHost *:80>`
	`(Change these lines to suit your project path)`
	`RailsEnv development`
	`ServerName dev.socialbeam.com`
	`DocumentRoot /APP DIRECTORY PATH/public`
	`</VirtualHost>`
* Open `sudo vim /etc/hosts` and add **127.0.0.1   dev.socialbeam.com**
* `sudo a2ensite dev.socialbeam.com`
* `sudo service apache2 restart`

> **On localbox open dev.socialbeam.com , if everything ran fine till here then you should be able to see the Home Page of Socialbeam.**
      
### Virtual Host Setup in Amazon EC2 Instance
Once these lines the copied to apache2.conf go forward with creating virtual host on localbox
* `sudo a2enmod rewrite`
* Add the below lines to a new sites-available file `sudo vim /etc/apache2/sites-available/default`
     	`<VirtualHost *:80>`
	`RailsEnv production`
	`DocumentRoot /var/www/socialbeam_production/current/public`
	`</VirtualHost>`
* `sudo a2ensite dev.socialbeam.com`
* `sudo service apache2 restart`

> **On localbox open dev.socialbeam.com , if everything ran fine till here then you should be able to see the Home Page of Socialbeam.**


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

**Tutorial on www.raycoding.net for more details.**
