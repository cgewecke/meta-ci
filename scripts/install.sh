#!/usr/bin/env bash

# Install
npm install

# For each target, run a top level install there, return here.
cd zeppelin-solidity
npm install
cd ..

# Install dependencies via meta
./node_modules/.bin/meta git update
./node_modules/.bin/meta npm install
./node_modules/.bin/meta npm symlink


