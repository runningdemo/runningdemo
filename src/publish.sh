#!/bin/bash
cd "$(dirname "$BASH_SOURCE")"
# sh ./build.sh
if [ -z $(git status --porcelain) ]; then
  echo 'not changed'
else
  echo 'changed'
  git add -A
  git commit -m "publish"
fi

# git push
