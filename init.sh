#!/usr/bin/env sh

if [ -z $1 ]
then
    CURR=$(basename $(pwd))
    cd ..
else
    CURR=$1
fi

case $CURR in
1*|01*)
    if cd 01-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 01-"
        exit 1
    fi

    git init
    echo "I'm a text file!" > hello.txt
    chmod 755 hello.txt
    git add hello.txt
    git commit -m "Inital commit"
    echo "With ~style~" >> hello.txt

    exit 0
;;

2*|02*)
    if cd 02-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 02-"
        exit 1
    fi

    echo "I'm a text file!" > hello.txt

    git init
    chmod 755 hello.txt
    git add hello.txt
    git commit -m "Inital commit"

    exit 0
;;

3*|03*)
    if cd 03-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 03-"
        exit 1
    fi

    echo "I'm a text file!" > hello.txt

    git init
    chmod 755 hello.txt
    git add hello.txt
    git commit -m "Inital commit"

    echo "A new line" >> hello.txt

    git add hello.txt
    git commit -m "Did the thing... WAIT!"

    echo "And another new line" >> hello.txt

    exit 0
;;

4*|04*)
    if cd 04-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 04-"
        exit 1
    fi

    echo "I'm a text file!" > hello.txt

    git init
    chmod 755 hello.txt
    git add hello.txt
    git commit -m "Inital commit"
    git branch -m "get-away-from-me"

    exit 0
;;

5*|05*)
    if cd 05-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 05-"
        exit 1
    fi

    echo "def f(): pass # Not implemented" > code.py
    echo >> code.py
    echo "print(f())" >> code.py

    git init
    git checkout -b master
    chmod 755 code.py
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

6*|06*)
    if cd 06-*
    then
        rm -rf * .git
    else
        echo "Could not find a directory beginning with 06-"
        exit 1
    fi

    echo "def f(): return 1" > code.py
    echo >> code.py
    echo "print(f())" >> code.py

    git init
    git checkout -b master
    chmod 755 code.py
    git add code.py
    git commit -m "Inital commit"

    git checkout -b implement-g
    echo >> code.py
    echo "def g(): return 2" > code.py
    echo >> code.py
    echo "print(g())" >> code.py
    git commit code.py -m "Implement g"

    git checkout master

    echo >> code.py
    echo "def h(): return 3" > code.py
    echo >> code.py
    echo "print(h())" >> code.py
    git commit code.py -m "Implement h"

    git merge implement-g

    exit 0
;;

esac

echo "Don't know what task that is..."
echo "Possible exercises:"
ls .
exit 1
