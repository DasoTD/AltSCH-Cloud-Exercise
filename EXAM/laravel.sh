#!/bin/bash

sudo apt update -y

sudo apt install apache2 -y

sudo add-apt-repository ppa:ondrej/php --yes

sudo apt update -y

sudo apt install php8.2 -y

sudo apt install php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-mysql zip unzip -y

sudo a2enmod rewrite

sudo systemctl restart apache2

cd /usr/bin
install composer globally -y
sudo curl -sS https://getcomposer.org/installer | sudo php -q

sudo mv composer.phar composer

cd /var/www/

sudo git clone https://github.com/laravel/laravel.git

sudo chown -R $USER:$USER /var/www/laravel

cd laravel/

install composer autoloader

composer install --optimize-autoloader --no-dev --no-interaction

composer update --no-interaction

sudo cp .env.example .env

sudo chown -R www-data storage

sudo chown -R www-data bootstrap/cache

cd /etc/apache2/sites-available/

sudo touch exam.conf

sudo echo '<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/laravel/public

    <Directory /var/www/laravel>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/laravel-error.log
    CustomLog ${APACHE_LOG_DIR}/laravel-access.log combined
</VirtualHost>' | sudo tee /etc/apache2/sites-available/exam.conf

sudo a2ensite exam.conf

sudo a2dissite 000-default.conf

sudo systemctl restart apache2

cd

sudo apt install mysql-server -y

sudo apt install mysql-client -y

sudo systemctl start mysql

sudo mysql -uroot -e "CREATE DATABASE Altschool;"

sudo mysql -uroot -e "CREATE USER 'timmy'@'localhost' IDENTIFIED BY 'sultan';"

sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON Altschool.* TO 'timmy'@'localhost';"

cd /var/www/laravel

sudo sed -i "23 s/^#//g" /var/www/laravel/.env

sudo sed -i "24 s/^#//g" /var/www/laravel/.env

sudo sed -i "25 s/^#//g" /var/www/laravel/.env

sudo sed -i "26 s/^#//g" /var/www/laravel/.env

sudo sed -i "27 s/^#//g" /var/www/laravel/.env

sudo sed -i '22 s/=sqlite/=mysql/' /var/www/laravel/.env

sudo sed -i '23 s/=127.0.0.1/=localhost/' /var/www/laravel/.env

sudo sed -i '24 s/=3306/=3306/' /var/www/laravel/.env

sudo sed -i '25 s/=laravel/=Altschool/' /var/www/laravel/.env

sudo sed -i '26 s/=root/=timmy/' /var/www/laravel/.env

sudo sed -i '27 s/=/=sultan/' /var/www/laravel/.env

sudo php artisan key:generate

sudo php artisan storage:link

sudo php artisan migrate

sudo php artisan db:seed

sudo systemctl restart apache2