	set -e
	function say_green
	{
		echo -e '\E[00;32m'"\033[1m$@\033[0m"
	}
	function say_red
	{
		echo -e '\E[00;31m'"\033[1m$@\033[0m"
	}
	function say_cyan
	{
		echo -e '\E[00;36m'"\033[1m$@\033[0m"
	}
	function say_yellow
	{
		echo -e '\E[01;33m'"\033[1m$@\033[0m"
	}

	function  local_install_java
	{
		d=`pwd`
		
		sudo mkdir /usr/lib/jvm
		
		cd /usr/lib/jvm
		
		say_cyan " Downloading jdk-6u29-linux-i586.bin in your /usr/lib/jvm folder"
		sudo wget https://s3.amazonaws.com/socialbeam-repo/jdk/jdk-6u29-linux-i586.bin
		
		sudo chmod +x jdk-6u29-linux-i586.bin
		
		sudo ./jdk-6u29-linux-i586.bin
		
		say_green "JDK 6.0 Update 29 Installation complete"
		say_yellow "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29"
		say_yellow "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre"
		sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29" >> ~/.bashrc
		
		sudo echo "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre" >> ~/.bashrc
		
		say_yellow "Added JAVA PATH variables  to ~/.bashrc"
		export PATH=$PATH:/usr/lib/jvm/jdk1.6.0_29/bin
		
		cd $d
		
		say_green "Sourcing ~/.bashrc"
		source ~/.bashrc
		
	}

	function aws_install_java
	{
		d=`pwd`
		
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
		
		cd $d
		
		say_red "Sourcing /etc/profile"
		source /etc/profile
		
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

	function local_install_rvm_ruby
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

	function aws_install_rvm_ruby_systemwide
	{
		say_green "installing RVM for current user"
		\curl -L https://get.rvm.io | bash -s stable
		
		say_green "Completed installation of RVM"
		say_green "Installing Ruby 1.9.2 in RVM"
		rvm install 1.9.2
		
		rvm use 1.9.2
		
		say_green "Completed installing Ruby 1.9.2"
		say_red "Sourcing /etc/profile"
		source /etc/profile
		
	}

	function local_install_rails3
	{
		userails3.2.11
		
		say_yellow "Installing Rails 3.2.11 in gemset"
		gem install rails -v=3.2.11
		
		say_green "Completed installing Rails 3.2.11"
	}

	function aws_install_rails3
	{
		say_yellow "Installing Rails 3.2.11"
		gem install rails -v=3.2.11
		
		say_green "Completed installing Rails 3.2.11"
	}


	function install_myql
	{
		say_yellow "Installing MySQL Server and Client Packges"
		sudo apt-get install libmysqlclient-dev 
		
		say_yellow "Installing mysql and mysql2 gems"
		gem install mysql -v=2.9.0
		
		gem install mysql2 -v=0.3.11
		
		say_green"Completed installing mysql and mysql2  gems"
		sudo apt-get install mysql-server-5.1
		
		say_green "Completed installing MySQL Server and Client Packges"

	}

	function  install_apache2
	{
		say_yellow "Installing Apache2"
		sudo apt-get install apache2 apache2-mpm-prefork apache2-prefork-dev
		
		say_green "Completed installing Apache2"
	}

	function install_passenger_rails
	{
		say_yellow "Installing Passenger Mod Rails gem"
		sudo apt-get install libcurl4-openssl-dev
		
		gem install passenger -v 3.0.19
		
		say_green "Completed installing Passenger Mod Rails gem"
		say_yellow "Installing Apache2 Module for passenger,"
		say_cyan "Please take note at the end of this module installation Passenger will as you to copy three Config Lines to /etc/apache2/apach2.conf "
		say_cyan "Please copy  those three lines while installation proceeds so that you can paste them in apache2.conf at the end of this installation script"
		passenger-install-apache2-module
		
		say_green "Completed installing Apache2 Module for passenger"
	}

	function setup
	{
		if  [ "$1" == "amazonbox" ]; then
			if [ $(id -un) == "ubuntu" ]; then
				if [ "$AWS_STEP" == "" ];then
					say_cyan "Setting Up Enviromnet for $1 - Creating System Step 1"
					say_red "Giving permission to User - ubuntu on AWS to write to PATHS in /etc/profile"
					say_green "sudo chmod 775 /etc/profile"
					sudo chmod 775 /etc/profile
					
					get_essentials
					aws_install_java
					aws_install_rvm_ruby_systemwide
					export AWS_STEP="2"
					say_green "Setting Up Enviromnet for $1 - Step 1 Complete"
					say_cyan "Please logout and log back in for changes to take place and initiate Step 2 by calling setup same way"
				elif [ "$AWS_STEP" == "2" ];then
					say_cyan "Setting Up Enviromnet for $1 - Creating System Step 2"
					say_red "Sourcing /etc/profile"
					source /etc/profile
					local_install_rails3
					install_myql
					install_apache2
					install_passenger_rails
					export AWS_STEP=""
				fi
			else
				say_red "Interrupted:: You must be logged in as User named ubuntu in your Amazon EC2 Instance Server Box to run this script"
				export AWS_STEP=""
			fi
		elif [ "$1" == "localbox" ];then
			say_cyan "Setting Up Enviromnet for $1"
			get_essentials
			local_install_rvm_ruby
			local_install_rails3
			install_myql
			install_apache2
			install_passenger_rails
			say_red "Sourcing ~/.bashrc"
	        source ~/.bashrc
	        local_install_java
			say_green "Installation Complete"
		else
			say_red "please pass either 'localbox' or 'amazonbox' as argument"
		fi
	}
	#Calling Setup Function with Argument :localbox or :amamzonbox
	setup $1
