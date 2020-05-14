PROJECT=ExampleFlask


dist-install:
	sudo apt install apache2 libapache2-mod-wsgi-py3 python-dev
	# pip3 install flask

install:
	sudo mkdir -p /var/www/$(PROJECT)/html
	sudo mkdir -p /var/www/$(PROJECT)/logs
	sudo install my_flask_app.wsgi /var/www/$(PROJECT)
	sudo cp -a $(PROJECT) /var/www/$(PROJECT)/
	sudo chown -R www-data:www-data /var/www/$(PROJECT)
	sudo chmod -R 755 /var/www/$(PROJECT)
	sudo install $(PROJECT).conf /etc/apache2/sites-available
	sudo a2ensite $(PROJECT)
	sudo systemctl reload apache2
# 	sudo a2ensite /etc/apache2/sites-available/$(PROJECT)
# 	sudo service apache2 restart
# 	sudo apache2 -f /etc/apache2/apache2.conf -k stop
# 	sudo apache2 -f /etc/apache2/apache2.conf -k start

uninstall:
	sudo rm /etc/apache2/sites-available/$(PROJECT).conf
	sudo rm -rf /var/www/$(PROJECT)

verify:
	service apache2 status
