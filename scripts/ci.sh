#!/bin/bash

# Default branch
BRANCH="develop"
TIME_ID=`date +%Y-%m-%d::%H:%M:%S`

# Set to argv if present
if ! [ -z $1 ]; then
  BRANCH=$1
fi

# Set truffle branch to checkout in CI
printf "TRUFFLE_BRANCH=$BRANCH" > .wildtruffle

# Make sure git thinks we changed something
date +%s > .dirty

# Push
# git add -A
# git commit -a -m "Truffle branch \"$BRANCH\" at $TIME_ID"
# git push

echo "Running \"$BRANCH\" on Travis shortly."
