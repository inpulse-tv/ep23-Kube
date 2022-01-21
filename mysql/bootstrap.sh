mysql -u root -v -e "CREATE DATABASE pouletmayo;"
mysql -u root -v --default-character-set=utf8 pouletmayo < mysql/dump.sql
