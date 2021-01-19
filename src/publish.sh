#!/bin/bash

sh ./build.sh

git add .
git commit -m "publish"
git push
