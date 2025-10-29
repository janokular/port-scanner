#!/bin/bash

# localhost TCP port scanner

host=localhost

if [[ $# -ne 2 ]]; then
  echo 'Provide two arguments'
  exit 1
fi

start_port=$1
end_port=$2

echo 'Scanning ports...'
for (( port=$start_port; port<=$end_port; port++ )); do
  timeout 1 bash -c "< /dev/tcp/$host/$port" 2&> /dev/null
  if [[ $? -eq 0 ]]; then
    echo "$host has open port $port"
  fi
done
