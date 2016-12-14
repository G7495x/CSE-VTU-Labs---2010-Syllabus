#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

blue='\033[1;34m'
normal='\033[0m'

#LAMP Stack installation
echo -e "${blue}
Install LAMP stack...
Step 1: Update repositories
${normal}"
apt update

echo -e "${blue}
Step 2: Install Apache Server and enable CGI
${normal}"
apt -y install apache2
a2enmod cgi

echo -e "${blue}
Step 3: Install MySQL
You will be prompted to enter root password!
${normal}"
apt -y install mysql-server mysql-client

echo -e "${blue}
Step 4: Install PHP
${normal}"
apt -y install php libapache2-mod-php php-mysql php-mcrypt

echo -e "${blue}
Step 5: Install PHPMyAdmin
You will be prompted to configure and enter password!
${normal}"
apt -y install phpmyadmin php-mbstring php-gettext
phpenmod mcrypt
phpenmod mbstring

echo -e "${blue}
Step 6: Install DB Interface and MySQL DB Driver for Perl
${normal}"
cpan DBI DBD::mysql

echo -e "${blue}
Step 7: Restart Apache
${normal}"
systemctl restart apache2

#Additional tasks
echo -e "${blue}
Additional tasks...
Creating appropriate directories
${normal}"

mkdir /usr/lib/cgi-bin/web-lab
chmod 777 /usr/lib/cgi-bin/web-lab/

mkdir /var/www/html/web-lab
chmod 777 /var/www/html/web-lab/