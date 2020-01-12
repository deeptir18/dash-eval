#!/bin/bash
clientmount=$1
sudo umount ${clientmount} > /dev/null 2>&1
