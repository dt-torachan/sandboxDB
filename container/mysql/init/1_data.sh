#!/bin/sh

mysql_command=`echo "${mysql[@]}"`

while read line
do
   line=`echo ${line} | sed -e "s/[\r\n]\+//g"`
   echo $line
   $mysql_command < /var/www/sql/$line
done < /docker-entrypoint-initdb.d/files.txt
