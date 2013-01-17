function say_green
{
    echo -e '\E[00;32m'"\033[1m$@\033[0m"
}

function say_red
{
    echo -e '\E[47;31m'"\033[1m$@\033[0m"
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

function setup_aws_box_step2
{
  if [ $(id -un) = "ubuntu" ]; then
  say_red "Giving permission to User - ubuntu on AWS to write to PATHS in /etc/profile"
  say_green "sudo chmod 775 /etc/profile"
  sudo chmod 775 /etc/profile
  install_rails3
  install_myql
  install_apache2
  install_passenger_rails
  else
  say_red "Interrupted:: You must be logged in as User named ubuntu to run this script"
  fi
}


