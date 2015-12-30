#!/usr/bin/env bash

###
# Simple script used to check a binary backup (created with Percona Xtrabackup for example).
###

MYSQL_DATADIR=$1
MYSQL_OPTS=$2
MYSQLADMIN_OPTS=$3

chown -R mysql:mysql ${MYSQL_DATADIR}
mysqld --datadir=${MYSQL_DATADIR} ${MYSQL_OPTS} &
sleep 10
mysqladmin -u root ${MYSQLADMIN_OPTS} status
RET=$?
exit ${RET}
