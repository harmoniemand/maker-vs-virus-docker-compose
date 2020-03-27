FROM wordpress:5.3.2-php7.2-apache

# COPY ./plugins /var/www/html/wp-content/plugins
# COPY ./themes /var/www/html/wp-content/themes
# COPY ./wp-config.php /var/www/html/wp-config.php

RUN apt-get update
RUN apt-get install --no-install-recommends -y tidy csstidy nano netcat 

RUN apt-get install software-properties-common -y && \
    apt-get update -y && \
    apt-get install ldap-utils libldap2-dev -y

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap
