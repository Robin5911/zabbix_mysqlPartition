#!/bin/sh
mysql -uroot -p'*****' zabbix -e "CALL partition_maintenance_all('zabbix');"
