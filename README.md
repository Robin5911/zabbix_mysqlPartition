Zabbix 数据库优化 - MySQL表分区


#
一、先修改两张表的结构：
>alter table history_text drop primary key, add index (id), drop index history_text_2, add index history_text_2 (itemid, id);
>alter table history_log drop primary key, add index (id), drop index history_log_2, add index history_log_2 (itemid, id);

二、创建存储过程 partition_call.sql

#mysql -uroot -p'******' zabbix < partition_call.sql

三、导入存储过程 partition_all.sql (自己根据实际天数更改SQL里的配置)

#mysql -uroot -p'******' zabbix < partion_all.sql

四、每天定时计划任务使用存储过程

#crontab -e

00 02 * * * /root/mysql_partition.sh
