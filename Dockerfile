FROM php:7.2-apache

ADD root/ /
# Fix the original permissions of /tmp, the PHP default upload tmp dir.
RUN chmod 777 /tmp && chmod +t /tmp
# Setup the required extensions.
RUN /tmp/setup/php-extensions.sh
RUN /tmp/setup/oci8-extension.sh

RUN mkdir /var/www/moodledata && chown www-data /var/www/moodledata && \
    mkdir /var/www/phpunitdata && chown www-data /var/www/phpunitdata && \
    mkdir /var/www/behatdata && chown www-data /var/www/behatdata && \
    mkdir /var/www/behatfaildumps && chown www-data /var/www/behatfaildumps
    
#overwrite old config with custom config with export Document root
COPY configs/000-default.conf /etc/apache2/sites-enabled/000-default.conf
