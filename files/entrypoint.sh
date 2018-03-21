#!/usr/bin/env bash

umask 022

#do a string replace for configuration files for the web root. 
if [[ "${APACHE_WEB_ROOT}" != "" ]]; then
    sed -i "s#<<APACHE_WEB_ROOT>>#${APACHE_WEB_ROOT}#" /etc/apache2/sites-enabled/000-default.conf
	sed -i "s#%%APACHE_WEB_ROOT%%#${APACHE_WEB_ROOT}#" /etc/apache2/apache2.conf
else
    #set a default if one is not present
    APACHE_ROOT="/var/www/html"
    sed -i "s#<<APACHE_WEB_ROOT>>#${APACHE_ROOT}#" /etc/apache2/sites-enabled/000-default.conf
	sed -i "s#%%APACHE_WEB_ROOT%%#${APACHE_ROOT}#" /etc/apache2/apache2.conf
fi


if [[ $# -eq 1 && $1 == "bash" ]]; then
	$@;
else
	exec "$@";
fi