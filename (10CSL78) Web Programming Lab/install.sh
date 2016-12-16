#!/bin/bash

if [ "$EUID" -ne 0 ]
then
	echo "Please run as root"
	exit
fi

b='\033[1;34m'		#Bold Blue color
n='\033[0m'			#Reset to normal

#LAMP Stack installation
echo -e "${b}
Install LAMP stack...
Step 1: Update repositories
${n}"
apt update

echo -e "${b}
Step 2: Install Apache Server and enable CGI
${n}"
apt -y install apache2
a2enmod cgi			#Enable CGI module

echo -e "${b}
Step 3: Install MySQL
You will be prompted to enter root password!
${n}"
apt -y install mysql-server mysql-client

echo -e "${b}
Step 4: Install PHP
${n}"
apt -y install php libapache2-mod-php php-mysql php-mcrypt

echo -e "${b}
Step 5: Install PHPMyAdmin
You will be prompted to configure and enter password!
${n}"
apt -y install phpmyadmin php-mbstring php-gettext
phpenmod mcrypt		#Enable modules
phpenmod mbstring

echo -e "${b}
Step 6: Install DB Interface and MySQL DB Driver for Perl
${n}"
apt -y install libdbd-mysql-perl
cpan DBI DBD::mysql

echo -e "${b}
Step 7: Restart Apache
${n}"
systemctl restart apache2

#Ruby on Rails installation
echo -e "${b}
Install Ruby on Rails...
${n}"
apt -y install libmysqld-dev nodejs
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --ruby --rails

if grep -q 'source /usr/local/rvm/scripts/rvm' ~/.profile
then
	echo -e "${b}\nRVM already added to ~/.profile${n}\n"
else
	echo -e '\nsource /usr/local/rvm/scripts/rvm'>>~/.profile
	echo -e "${b}\nLog-off and Log-on for Ruby on Rails to work on other terminals also.${n}\n"
	source /usr/local/rvm/scripts/rvm
fi

#Additional tasks
echo -e "${b}
Additional tasks...
Creating appropriate directories
${n}"

mkdir /usr/lib/cgi-bin/web-lab
chmod 777 /usr/lib/cgi-bin/web-lab/

mkdir /var/www/html/web-lab
chmod 777 /var/www/html/web-lab/