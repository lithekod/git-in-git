#!/usr/bin/env bash

git init
git add hello.txt
git commit -m "Inital commit"

echo "A new line" >> hello.txt
git add hello.txt
git commit -m "Did the thing... WAIT!"

echo "And another new line" >> hello.txt
