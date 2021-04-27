#!/bin/bash
cd "$(dirname "$BASH_SOURCE")"
sh ./build.sh
echo 'start git'
git add .
git commit -m "publish"
git push
