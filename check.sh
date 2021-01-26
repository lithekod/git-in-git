#!/usr/bin/env sh

case $1 in
1*|01*)
    cd 01-*

    if ! git diff --quiet
    then
        echo "There are unstaged changes"
        exit 1
    fi
    echo "SOLVED"
    exit 0
;;

2*|02*)
    cd 02-*

    if ! git diff --quiet
    then
        echo "There are unstaged changes"
        exit 1
    fi

    NR=$(git rev-list --count HEAD)
    if test $NR -lt 2
    then
        echo "I didn't find any new commits"
        exit 1
    fi

    echo "SOLVED"
    exit 0
;;

3*|03*)
    cd 03-*

    if ! git diff --quiet
    then
        echo "There are unstaged changes"
        exit 1
    fi

    NR=$(git rev-list --count HEAD)
    if test $NR -gt 2
    then
        echo "I found a new commit, but I only wanted the two that were already there"
        exit 1
    fi

    echo "SOLVED"
    exit 0
;;

4*|04*)
    cd 04-*

    if ! git diff --quiet
    then
        echo "There are unstaged changes"
        exit 1
    fi

    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if test "$BRANCH" = "get-away-from-me"
    then
        echo "Looks like you're still on the main branch"
        exit 1
    fi

    echo "SOLVED"
    exit 0
;;

5*|05*)
    cd 05-*

    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if test "$BRANCH" = "implement-f"
    then
        echo "Looks like you're on the 'implement-f' branch."
        echo "You need to return to the 'master' branch."
        exit 1
    fi

    CMP=$(echo "def f(): return 42"; echo; echo "print(f())")
    CUR=$(cat code.py)
    if test "$CMP" != "$CUR"
    then
        echo "Looks like the file has not been merged yet"
        exit 1
    fi

    echo "SOLVED"
    exit 0
;;

6*|06*)
    cd 06-*

    if ! git diff --quiet
    then
        echo "There are still conflicts"
        exit 1
    fi

    echo "SOLVED"
    exit 0
;;

esac

echo "Don't know what task that is..."
echo "Possible exercises:"
ls .
exit 1
