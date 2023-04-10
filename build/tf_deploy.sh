git fetch --prune --unshallow 2>/dev/null
CURRENT_VERSION=`git describe --abbrev=0 --tags 2>/dev/null`

echo "Current Version: $CURRENT_VERSION"


echo "git-tag=$CURRENT_VERSION" >> $GITHUB_OUTPUT

exit 0


