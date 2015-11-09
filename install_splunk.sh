#!/bin/sh
export SPLUNK_RPM_PKG=$1
export SPLUNK_HOME=/opt/splunk

echo 1.change ACL 
sudo chmod 744 $SPLUNK_RPM_PKG

echo 2.install splunk
sudo rpm -ivh $SPLUNK_RPM_PKG

echo 3.service start
sudo $SPLUNK_HOME/bin/splunk start --answer-yes --no-prompt --accept-license
sudo $SPLUNK_HOME/bin/splunk enable boot-start -user splunk

echo 4.check status
cat $SPLUNK_HOME/var/log/splunk/splunkd.log
ps -A | grep splunk



