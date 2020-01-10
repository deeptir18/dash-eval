#!/bin/bash
ssh_cmd="kill -9 \`ps aux | grep ${SERVER_BINARY} | awk \'{print \$2}\' | head -1 \`"
ssh ${USERNAME}@${SERVER} -i ${KEY} $ssh_cmd
