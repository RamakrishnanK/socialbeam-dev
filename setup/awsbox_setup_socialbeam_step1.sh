function install_java
{
    sudo mkdir /usr/lib/jvm
    cd /usr/lib/jvm
    echo " downloading jdk-6u29-linux-i586.bin in your /usr/lib/jvm folder"
    sudo wget https://s3.amazonaws.com/socialbeam-repo/jdk/jdk-6u29-linux-i586.bin
    sudo chmod +x jdk-6u29-linux-i586.bin
    sudo ./jdk-6u29-linux-i586.bin
    echo "JDK 6.0 Update 29 Installation complete"
    echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29"
    echo "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre"
    sudo echo "export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_29" >> /etc/profile
    sudo echo "export JRE_HOME=/usr/lib/jvm/jdk1.6.0_29/jre" >> /etc/profile
    echo "Added JAVA PATH variables  to ~/.bashrc"
    source  /etc/profile
}

function setup_aws_box_step1
{
  if [[ $(id -un)=="user" ]]; then
  install_java
  else
  echo "Please ssh with into your Amazon AWS with user [ubuntu]"
  echo "Press any key to exit"
  read continueOn
  fi
}
