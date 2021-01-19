git diff --exit-code &> /dev/null
RET=$?
if [[ $RET -ne 0 ]]
then
    echo "There are unstaged changes"
    exit 1
fi

NR=$(git rev-list --count HEAD)
NR=$((NR))
if [[ $NR -lt 2 ]]
then
    echo "I didn't find any new commits"
    exit 1
fi

echo "SOLVED"
exit 0
