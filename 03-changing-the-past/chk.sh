git diff --exit-code &> /dev/null
RET=$?
if [[ $RET -ne 0 ]]
then
    echo "There are unstaged changes"
    exit 1
fi

NR=$(git rev-list --count HEAD)
NR=$((NR))
if [[ $NR -ne 2 ]]
then
    echo "You should change the old commit"
    exit 1
fi

echo "SOLVED"
exit 0
