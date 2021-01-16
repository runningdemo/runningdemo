#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap shutdown_server EXIT

(python -m http.server 4000)&
server_pid=$!

function shutdown_server() {
  echo "exit script"
  kill ${server_pid}
  exit 2 
}

while [[ 1 ]]; do inotifywait -e modify ./src/* ~/vimwiki/*.md; ./src/build.sh; done;while [[ 1 ]]; do inotifywait -e modify ./src/* ~/vimwiki/*.md; ./src/build.sh; done;





