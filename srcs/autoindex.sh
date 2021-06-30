#!/bin/bash

red="\e[1;31m"
green="\e[1;32m"
white="\e[0;m"
purple="\e[1;35m"
orange="\e[0;33m"


on()
{
sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/localhost
}

off()
{
sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost
}

status()
{
check=$( cat /etc/nginx/sites-available/localhost | grep autoindex | cut -d" " -f6 | cut -d\; -f1 )
[ "$check" = "on" ] && status="${green}ON"
[ "$check" = "off" ] && status="${red}OFF"
printf "\n${orange}Autoindex $2 status :\033[40G${status}\n${white}"
[ "$1" = "only" ] && exit 0
if [ ! "$1" = "$check" ] ; then
	reload="yes"
else
	printf "\n${purple}No changes made!${white}\n"
fi
}


case "$1" in
    "off" | "on")
	status "$1" current
	[ "$reload" = "yes" ] && "$1" && service nginx restart && status only new
	;;
    *)
	status only current
	;;
esac

exit 0
