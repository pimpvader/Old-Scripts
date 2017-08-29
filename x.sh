#!/bin/bash

echo "# Old-Scripts" >> README.md
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/pimpvader/Old-Scripts.git
igot remote -v
git push -u origin master
