#!/usr/bin/env bash

# Install
echo "Installing wild-truffle ..."
#npm install

# For each target, run a top level install there, return here.
echo "Installing zeppelin-solidity ..."
#cd zeppelin-solidity
#npm install
#cd ..

# Install dependencies via meta
echo "Installing meta dependencies ..."
meta git update
meta npm install
meta npm symlink


