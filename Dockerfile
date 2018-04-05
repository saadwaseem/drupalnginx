From drupal:8.5-fpm
RUN apt-get update && apt-get install -y \
	curl \
	git \
	mysql-client \
	vim \
	wget
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	php -r "unlink('composer-setup.php');"
RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar && \
	chmod +x drush.phar && \
	mv drush.phar /usr/local/bin/drush

RUN rm -rf /var/www/html/*

#COPY nginx-drupal.conf /etc/nginx/conf.d/
#ADD ./app /app
WORKDIR /code

