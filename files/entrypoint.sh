#!/usr/bin/env bash

umask 022

#do a string replace for configuration files for the web root. 
if [[ "${APACHE_WEB_ROOT}" != "" ]]; then
    echo "web site will be set to ${APACHE_WEB_ROOT}"
else
    #set a default if one is not present
    APACHE_WEB_ROOT="/var/www/html"    
fi

sed -i "s#<<APACHE_WEB_ROOT>>#${APACHE_WEB_ROOT}#" /etc/apache2/sites-enabled/000-default.conf
sed -i "s#%%APACHE_WEB_ROOT%%#${APACHE_WEB_ROOT}#" /etc/apache2/apache2.conf


if [[ $# -eq 1 && $1 == "bash" ]]; then
	$@;
else
	exec "$@";
fi
