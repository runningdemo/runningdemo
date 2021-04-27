#!/bin/bash
cd "$(dirname "$BASH_SOURCE")"
sh ./build.sh
git add -A
git commit -m "publish"
git push
