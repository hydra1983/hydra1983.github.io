#!/bin/bash

hexo clean
rm -rf .deploy
hexo deploy
