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
    say_green "Downloading jdk-6u29-linux-i586.bin in your /usr/lib/jvm folder"
    sudo wget http://s3.amazonaws.com/socialbeam-repo/jdk/jdk-6u29-linux-i586.bin
    sudo chmod +x jdk-6u29-linux-i586.bin
    sudo ./jdk-6u29-linux-i586.bin
    cd /var/www/socialbeam-production/current
    say_green "JDK 6.0 Update 29 Installation complete"
    say_green "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29"
    say_green "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre"
    sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29" >> /etc/profile
    sudo echo "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre" >> /etc/profile
    say_green "Added JAVA PATH variables  to /etc/profile"
    export PATH=$PATH:/usr/lib/jvm/jdk1.6.0_29/bin
    say_red "Sourcing /etc/profile"
    source /etc/profile
}


function get_essentials
{
    echo "Updating apt-get"
    sudo apt-get update
    echo "Installing development packages"
    sudo apt-get install build-essential bison openssl libreadline5 libreadline-dev curl git zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev
    sudo apt-get install g++-multilib
    echo "Installing ImageMagik"
    sudo apt-get install imagemagick
    echo "Installing Memcached"
    sudo apt-get install memcached
    echo "Installing GIT and SVN"
    sudo apt-get install git-core subversion
}

function setup_aws_box_step1
{
  if [ $(id -un) = "ubuntu" ]; then
  say_red "Giving permission to User - ubuntu on AWS to write to PATHS in /etc/profile"
  say_green "sudo chmod 775 /etc/profile"
  sudo chmod 775 /etc/profile
  get_essentials
  install_java
  else
  say_red "Interrupted:: You must be logged in as User named ubuntu to run this script"
  fi
}
