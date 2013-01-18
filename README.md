# Social Network Development Project in Rails - SOCIALBEAM![Socialbeam](https://s3.amazonaws.com/socialbeam-repo/images/sb_large.png "Socialbeam")
Socialbeam is a Open Source Development Project for building a Social Network. In its early stages of development phase Socialbeam aims to implement
the primary set of features that a Social Network consists of. The structure of the platform Socialbeam hopefully will implement most if not all social network features that we see around presently. 
Socialbeam is concurrently developed on localbox running Ubuntu 11.10 and Amazon EC2 Instance Box. Please find below the guide to setup 
both localbox and also an Amazon EC2 Instance Server if you have happen to have one. The reason why deployment is concurrent in both local and server becuase it helps me understands the server management and load better and therfore build the system accordingly.

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
 
### Socialbeam Step by Step Development Tutorial 
* Look here [Socialbeam Development Tutorials](http://raycoding.net/category/ruby-on-rails/socialbeam-development-tutorial/)

### Configuration
* Socialbeam is running on RVM with Ruby 1.9.2 and Rails 3.2.11,MySQL, Apache2 - Passenger Rails,Capistrano

### For more details about important parts used for Project
* About Ruby on Rails [Getting Started](http://guides.rubyonrails.org/getting_started.html) and 
* About [RVM and Rubies Installation read here](https://rvm.io/rvm/install/) 
* About [Passenger Mod Rails and Apache2 Module](http://www.modrails.com/documentation/Users%20guide%20Apache.html) and and [RVM with Passenger read here](https://rvm.io/integration/passenger/)
* About Deployment with [Capistrano read here](https://github.com/capistrano/capistrano/wiki) and [RVM-Capistrano read here](https://github.com/wayneeseguin/rvm-capistrano)
* About [Using RVM with Capistrano read here](https://rvm.io/integration/capistrano/)

## Guide to setUp System on Local Box and also in Amazon EC2 Instance(if you have one)

### Local System Setup
* Clone the project into some direcrtory you want on your system.
* From the console enter the app directory and you will find a folder named `setup`
* In that folder there is a script named `install_socialbeam.sh`
* Executing this Script with appropriate argument would install Socialbeam with System Setup for both local box and Amazon EC2 Instance
* In colsole `cd` to the setup directory and execute `source ./install_socialbeam.sh`
* Now once you have sourced the script all you need to execute is `setup localbox`
* Sit back as the installation script will process and get everything needed on your localbox for Socialbeam to run

### Amazon EC2 Instance Setup
* Fork the project in your Github Repository and add ssh-keys for your Amazon EC2 Instance and Localbox for your Git Account.
* If you alread have an Amazon EC2 Instance running on Ubuntu 11.10 64Bit then the please read the following lines to get your system running on EC2
* ssh into your EC2 instance with default user `ubuntu` provided by Amazon for EC2 instances
* execute `cd /var/www/` and  execute `sudo chown -R ubuntu ./` and execute `sudo chgrp -R ubuntu ./`
* The previous lines are important as we need to own the www directory for user `ubuntu` where we are going to deploy our App
* Now copy the contents of `install_socialbeam.sh` and paste into some file on your server probably giving it the same name `install_socialbeam.sh`
* In colsole `cd` to the directory where you created the file and execute `source ./install_socialbeam.sh`
* Once sourced execute `setup amazonbox`. Now this installation is a two way step as you will notice as unlike local box we want to install RVM and RUBY and RAILS and every other thing SYSTEMWIDE
* So Step One of this installation will install RVM systemwide and create a group named `rvm` in `/etc/group`
* Open up /etc/group and right at the end you will find the group named `rvm` , after the colon(:) add `root,ubuntu`. Similarly right at the top for group named `root` add `ubuntu`. What we do here is add both `root` and `ubutu` Users to `rvm` group and add `ubuntu` User to `root` Group
* Now you can log out and ssh login back again.
* Once again `source install_socialbeam.sh` and execute `setup amazonbox` - This time you will notice it will be Step Two of the Installation.
* Wait for the installation to finish.Once installation is over enter your mysql client `mysql -uroot -p` and create a DB named `socialbeam_storage_prod`.You can also create two other DB named `socialbeam_storage_dev` and `socialbeam_storage_test`. But we would only require the firts one as this is Production Mode.
* Now logout and enter in your local box,migrate to the app directory. There you will find a script under config folder named `deploy.rb`
* Open the Script `deploy.rb` and modify the git repo link to your git repo link which forked this project.Also there you a server config with an `IP`,ofcourse you would have replace that IP with the `Elastic IP` or `End Point URL` of your Amazon EC2 Instance. Finally after modifying the `IP` save the file and from app directory in console run `cap deploy:setup`
* If "cap deploy:setup" is successful we are good to go with running `cap deploy`, wait till process deployment completes.
* Pease note I have considered you the added the ssh keys in your Server to access GIT, else cap deploy won't work)


### NOTE for both local box and Amazon EC2 Setup
* In both setups there is a part where Apache2 Module for Passenger is installed,during installation Passenger will promt you to copy three lines.
* The lines will be something like these.
  1.  __LoadModule passenger_module ....text__
  2.  __PassengerRoot ....text__
  3.  __PassengerRuby ....text__
* Make sure to copy the three lines generated while installation step tell you to becuase they won't be generated again.
* Once installation is finished copy the lines which is now in clipboard memory into your /etc/apache2/apache2.conf

### Virtual Host Setup in Localbox
Once these lines the copied to apache2.conf go forward with creating virtual host on localbox
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
      
### Virtual Host Setup in Amazon EC2 Instance
* Please note Capistrano (cap deploy) from your local box must run without errors before you start doing this step.
* Once these lines the copied to apache2.conf go forward with modifing the "default" Apache2 Virtual host on Amazon EC2 Instacne
* Enable Apache2 Rewrites - execute `sudo a2enmod rewrite`
* In the default file make changes, execute `sudo vim /etc/apache2/sites-available/default

	1. `<VirtualHost *:80>`
	2. `RailsEnv production`
	3. `DocumentRoot /var/www/socialbeam_production/current/public`
	4. `</VirtualHost>`
* Restart Apache - `sudo service apache2 restart`

> **If everything installed fine then you should be able to see the Home Page of Socialbeam on your Amazon EC2 Instance EndPoint URL or Elastic IP**


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
