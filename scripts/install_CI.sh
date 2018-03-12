#!/usr/bin/env bash

# Install
echo "Installing wild-truffle ..."
npm install

# For matrix target, run a top level install there, return here.
if [ "$ZEPPELIN" = true ]; then
  echo "Installing zeppelin-solidity ..."
  cd zeppelin-solidity
  npm install
  cd ..
elif [ "$ARAGON" = true]; then
  echo "Installing aragon-core ..."
  cd aragon-core
  npm install
  cd ..
elif [ "$COLONY" = true]; then
  echo "Installing colony-network ..."
  cd colony-network
  npm install
  cd ..
fi


# Install dependencies via meta
echo "Installing meta dependencies ..."
source .wild-truffle
meta git update
meta git checkout $TRUFFLE_BRANCH
meta npm install
meta npm symlink


