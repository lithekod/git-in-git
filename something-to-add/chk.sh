git status --porcelain | grep " M " -q
FOUND=$?
if [[ $FOUND ]]
then
    echo "SOLVED"
else
    echo "There are unstaged changes"
fi
