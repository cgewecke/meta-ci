#!/usr/bin/env bash

# Install
echo "Installing wild-truffle ..."
npm install -g yarn
npm install -g meta

# For matrix target, run a top level install there, return here.
if [ "$ZEPPELIN" = true ]; then
  echo "Installing zeppelin-solidity ..."
  cd targets/zeppelin-solidity
  npm install
  cd ../..
elif [ "$ARAGON" = true ]; then
  echo "Installing aragonOS ..."
  cd targets/aragonOS
  npm install
  cd ../..
elif [ "$COLONY" = true ]; then
  echo "Installing colonyNetwork ..."
  cd targets/colonyNetwork
  yarn
  git submodule update --init --remote --recursive
  cd ../..
fi

npm install
npm install --save-dev bignumber.js

# Install dependencies via meta
echo "Installing meta dependencies ..."
source .wildtruffle
meta git update
meta git checkout $TRUFFLE_BRANCH
meta npm install
meta npm symlink


