#!/bin/bash

# Verify we're not attempting to push to a protected branch
STATUS=$(git status)

if [[ $STATUS = *"master"* || $STATUS = *"develop"* ]]; then
  echo "** ERROR **"
  echo "You're on a protected branch (master/develop)."
  echo "Create a throwaway branch first: git checkout -b <throw-away-name>"
  echo ""
  exit 0
fi

# Get wildtruffle branch name
WILD=$(git rev-parse --abbrev-ref HEAD)
EXISTS=$(git ls-remote --heads git@github.com:cgewecke/meta-ci.git $WILD | wc -l)

# Set default truffle branch to checkout
BRANCH="develop"

# Set to argv if present
if ! [ -z $1 ]; then
  BRANCH=$1
fi

# Set truffle branch to checkout in CI
printf "TRUFFLE_BRANCH=$BRANCH" > .wildtruffle

# Make sure git thinks we changed something
date +%s > .dirty

# Get a helpful identifier for the commit
TIME_ID=`date +%Y-%m-%d::%H:%M:%S`

# Commit
git add -A
git commit -a -m "Truffle branch \"$BRANCH\" at $TIME_ID"

# Push
if [ $EXISTS == 0 ]; then
  git push --set-upstream origin $WILD
else
  git push
fi

echo "Running \"$BRANCH\" on Travis (shortly)."
