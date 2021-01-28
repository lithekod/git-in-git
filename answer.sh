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

5*|05*)
    echo "git merge implement-f"

    exit 0
;;

6*|06*)
    echo "# Remove row 5, blank row 9, and remove the last row"
    echo "sed '5d;9s/.*//;\$d' code.py > code.py"
    echo "git add ."
    echo "git commit -m 'Merge implement-g'"

    exit 0
;;

esac

echo "Don't know what task that is..."
echo "Possible exercises:"
ls .
exit 1
