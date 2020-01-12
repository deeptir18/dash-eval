#!/bin/bash
server=$1
servermount=$2
clientmount=$3
sudo mount -t nfs ${server}:${servermount} $clientmount
