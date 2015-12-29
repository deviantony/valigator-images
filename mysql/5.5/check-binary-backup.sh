#!/usr/bin/env bash

###
# Simple script used to check a binary backup (created with Percona Xtrabackup for example).
###

MYSQL_DATADIR=$1
MYSQL_OPTS=$2

chown -R mysql:mysql ${MYSQL_DATADIR}
mysqld --datadir=${MYSQL_DATADIR} ${MYSQL_OPTS} &
mysqladmin -u root status
RET=$?
exit ${RET}
