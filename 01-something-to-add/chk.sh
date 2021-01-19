git diff --exit-code &> /dev/null
RET=$?
if [[ $RET -eq 0 ]]
then
    echo "SOLVED"
    exit 0
else
    echo "There are unstaged changes"
    exit 1
fi
