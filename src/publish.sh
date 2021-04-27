#!/bin/bash
cd "$(dirname "$BASH_SOURCE")"
sh ./build.sh
git add .
git commit -m "publish"
git push
