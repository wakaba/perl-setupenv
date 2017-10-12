#!/bin/sh
echo "1..2"
basedir=$(cd `dirname $0`/../.. && pwd)
pmbp=$basedir/bin/pmbp.pl
tempdir=`perl -MFile::Temp=tempdir -e 'print tempdir'`/testapp

mkdir -p $tempdir/foo
cd $tempdir/foo && \
((perl $pmbp --install-mysqld && echo "ok 1") || echo "not ok 1")

((mysqld --version || /usr/sbin/mysqld --version) && echo "ok 2") || echo "not ok 2"

rm -fr $tempdir
