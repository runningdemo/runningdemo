#!/bin/bash

sh -c './build.sh'

git add .
git commit -m "publish"
git push
