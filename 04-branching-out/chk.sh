git diff --exit-code &> /dev/null
RET=$?
if [[ $RET -ne 0 ]]
then
    echo "There are unstaged changes"
    exit 1
fi

BRANCH=$(git branch --show-current)
if [[ "$BRANCH" = "main" ]]
then
    echo "Looks like you're still on the main branch"
    exit 1
fi

echo "SOLVED"
exit 0
