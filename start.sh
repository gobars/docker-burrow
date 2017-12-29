#!/bin/sh
CONFIG_FILE=/etc/burrow/burrow.toml
INFLUXDB_TMPL_FILE=/etc/burrow/tmpl/http-influxdb.tmpl
KAFKA_VERSION=${KAFKA_VERSION:-0.10.1.0}

sed -i "s/{ZOOKEEPER_SERVERS}/${ZOOKEEPER_SERVERS}/" $CONFIG_FILE
sed -i "s/{KAFKA_BROKERS}/${KAFKA_BROKERS}/" $CONFIG_FILE
sed -i "s/{KAFKA_VERSION}/${KAFKA_VERSION}/" $CONFIG_FILE

sed -i "s~{INFLUXDB_URL}~${INFLUXDB_URL}~" $CONFIG_FILE

echo "start"
cat $CONFIG_FILE

exec $GOPATH/bin/Burrow -config-dir /etc/burrow "${@}"
