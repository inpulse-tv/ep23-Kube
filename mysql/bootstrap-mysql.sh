#!/bin/bash
export MYSQL_PWD=password
mysql -u root -e "CREATE DATABASE pouletmayo"
mysql -u root --default-character-set=utf8 pouletmayo < dump.sql