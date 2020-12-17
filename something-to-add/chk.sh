git diff --exit-code &> /dev/null
RET=$?
if [[ $RET -eq 0 ]]
then
    echo "SOLVED"
else
    echo "There are unstaged changes"
fi
