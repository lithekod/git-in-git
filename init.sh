#!/usr/bin/env sh

case $1 in
1*|01*)
    cd 01-*
    rm -rf *

    git init
    echo "I'm a text file!" > hello.txt
    git add hello.txt
    git commit -m "Inital commit"
    echo "With ~style~" >> hello.txt

    exit 0
;;

2*|02*)
    cd 02-*
    rm -rf *

    echo "I'm a text file!" > hello.txt

    git init
    git add hello.txt
    git commit -m "Inital commit"

    exit 0
;;

3*|03*)
    cd 03-*
    rm -rf *

    echo "I'm a text file!" > hello.txt

    git init
    git add hello.txt
    git commit -m "Inital commit"

    echo "A new line" >> hello.txt

    git add hello.txt
    git commit -m "Did the thing... WAIT!"

    echo "And another new line" >> hello.txt

    exit 0
;;

4*|04*)
    cd 04-*
    rm -rf *

    echo "I'm a text file!" > hello.txt

    git init
    git add hello.txt
    git commit -m "Inital commit"
    git branch -m "get-away-from-me"

    exit 0
;;

5*|05*)
    cd 05-*
    rm -rf *

    echo "def f(): pass # Not implemented" > code.py
    echo >> code.py
    echo "print(f())" >> code.py

    git init
    git add code.py
    git commit -m "Inital commit"

    git checkout -b "implement-f"
    echo "def f(): return 42" > code.py
    echo >> code.py
    echo "print(f())" >> code.py
    git commit code.py -m "Implement f"

    git checkout master

    exit 0
;;

esac

echo "Don't know what task that is..."
echo "Possible exercises:"
ls .
exit 1

