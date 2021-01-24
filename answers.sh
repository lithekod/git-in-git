#!/usr/bin/env sh

# TODO(ed): Ask if you REALLY want to see the answers?

case $1 in
1*|01*)
    echo "git add ."

    exit 0
;;

2*|02*)
    echo "echo \"a new line\" >> hello.txt"
    echo "git add ."
    echo "git commit -m \"do the thing!\""

    exit 0
;;

3*|03*)
    echo "git add ."
    echo "git commit --amend -m \"do the thing!\""

    exit 0
;;

4*|04*)
    echo "git switch -c \"another-branch\""

    exit 0
;;


esac

echo "Don't know what task that is..."
echo "Possible exercises:"
ls .
exit 1
