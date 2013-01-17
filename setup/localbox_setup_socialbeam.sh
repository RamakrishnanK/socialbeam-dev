function say_green
{
    echo -e '\E[00;32m'"\033[1m$@\033[0m"
}

function say_red
{
    echo -e '\E[47;31m'"\033[1m$@\033[0m"
}

function install_java
{
    sudo mkdir /usr/lib/jvm
    cd /usr/lib/jvm
    say_green " downloading jdk-6u29-linux-i586.bin in your /usr/lib/jvm folder"
    sudo wget https://s3.amazonaws.com/socialbeam-repo/jdk/jdk-6u29-linux-i586.bin
    sudo chmod +x jdk-6u29-linux-i586.bin
    sudo ./jdk-6u29-linux-i586.bin
    say_green "JDK 6.0 Update 29 Installation complete"
    say_green "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29"
    say_green "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre"
    sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29" >> ~/.bashrc
    sudo echo "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre" >> ~/.bashrc
    say_green "Added JAVA PATH variables  to ~/.bashrc"
    export PATH=$PATH:/usr/lib/jvm/jdk1.6.0_29/bin
    say_red "Sourcing ~/.bashrc"
    source ~/.bashrc
}
  
function get_essentials
{
    say_green "Updating apt-get"
    sudo apt-get update
    say_green "Installing development packages"
    sudo apt-get install build-essential bison openssl libreadline5 libreadline-dev curl git zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev
   sudo apt-get install g++-multilib
    say_green "Installing ImageMagik"
    sudo apt-get install imagemagick
    say_green "Installing Memcached"
    sudo apt-get install memcached
    say_green "Installing GIT and SVN"
    sudo apt-get install git-core subversion
}
  
function install_rvm_ruby
{
    say_green "installing RVM for current user"
    \curl -L https://get.rvm.io | bash -s stable
   say_green "Completed installation of RVM"
   say_green "installing Ruby 1.9.2 to be used by RVM"
    rvm install 1.9.2
    rvm use 1.9.2
   say_green "Completed installing Ruby 1.9.2"
   say_green "Creating new  gemset inside RVM to install Rails 3.2.11, to keep our gems conflict free in case you install other versions of Rails "
    rvm gemset create rails3.2.11
   say_green "created gemset rails3.2.11, adding alias to ~/.bashrc so everytime you do not have to type - rvm use 1.9.2@rails3.2.11"
   say_green "alias userails3.2.11='rvm use 1.9.2@rails3.2.11'" 
   sudo echo "alias userails3.2.11='rvm use 1.9.2@rails3.2.11'" >> ~/.bashrc
   say_red "Sourcing ~/.bashrc"
   source ~/.bashrc
}
  
  
function install_rails3
{
    userails3.2.11
    say_green "Installing Rails 3.2.11 in gemset"
    gem install rails -v=3.2.11
    say_green "Completed installing Rails 3.2.11"
}
  
  
function install_myql
{
    say_green "Installing MySQL Server and Client Packges"
    sudo apt-get install libmysqlclient-dev 
    say_green "Installing mysql and mysql2 in gemset"
    gem install mysql -v=2.9.0
    gem install mysql2 -v=0.3.11
    sudo apt-get install mysql-server-5.1
}
  
  
function  install_apache2
{
    say_green "Installing Apache2"
    sudo apt-get install apache2 apache2-mpm-prefork apache2-prefork-dev
}

function install_passenger_rails
{
   say_green "Installing Passenger Mod Rails in gemset"
   sudo apt-get install libcurl4-openssl-dev
   gem install passenger -v 3.0.19
   say_green "Installing Apache2 Module for passenger,"
   say_green "Please take note at the end of this module installation Passenger will as you to copy three Config Lines to /etc/apache2/apach2.conf "
   say_green "Please copy  those three lines while installation proceeds so that you can paste them in apache2.conf at the end of this installation script"
   passenger-install-apache2-module
}

function setup_local_box
{
  get_essentials
  install_java
  install_rvm_ruby
  install_rails3
  install_myql
  install_apache2
  install_passenger_rails
}
