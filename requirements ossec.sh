#!/bin/bash
sudo apt-get install build-essential make zlib1g-dev libpcre2-dev libevent-dev libssl-dev libsqlite3-dev -y

wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash
apt-get update -y
apt-get install ossec-hids-agent -y
