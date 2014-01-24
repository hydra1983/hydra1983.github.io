#!/bin/bash

hexo clean
rm -rf .deploy
hexo deploy

git add -A .
git commit -m "Update sources"
git push
