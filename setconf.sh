#!/bin/sh

####
usage
1.set CONF_ZIP to splunk-testconf-master.zip name (not included extension. name only)
2.call this shell script. with argument

  if you set params to splunk indxer call  "setconf.sh idx"
  if you set params to splunkforwarder indxer call  "setconf.sh idx /opt/splunk"
####

export INSTANCE_TYPE=$1
export SPLUNK_HOME=$2
#get confzip
export CONF_ZIP_FILE=splunk-testconf-master
unzip  $CONF_ZIP_FILE.zip
echo param $1
echo param $2

#set conf for splunk instance with instance_type parameter.
if [ "$INSTANCE_TYPE" = "idx" ]; then
    cp -r ./$CONF_ZIP_FILE/splunk/etc  $SPLUNK_HOME
    echo set splunk indexer.

elif [ "$INSTANCE_TYPE" = "fwd" ]; then
    cp -r ./$CONF_ZIP_FILE/splunkforwarder/etc  $SPLUNK_HOME
    echo set splunkforwarder
else
    echo "NOT SET INSTANCE_TYPE(need to set idx or fwd )."
fi



