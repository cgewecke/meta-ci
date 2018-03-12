#!/usr/bin/env bash

# Exit script as soon as a command fails.
set -o errexit

npm run build
chmod +x build/cli.bundled.js

if [ "$ZEPPELIN" == true ]; then
  cd targets/zeppelin-solidity
  npm test
  cd ../..
elif [ "$ARAGON" == true ]; then
  cd targets/aragonOS
  npm test
  cd ../..
elif [ "$COLONY" == true ]; then
  cd targets/colonyNetwork
  npm run test:contracts
  cd ../..
fi