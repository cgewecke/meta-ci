#!/usr/bin/env bash
npm run build
chmod +x build/cli.bundled.js

if [ "$ZEPPELIN" = true ]; then
  cd zeppelin-solidity
  npm test
  cd ..
elif [ "$ARAGON" = true]; then
  cd aragon-core
  npm test
  cd ..
elif [ "$COLONY" = true]; then
  cd aragon-core
  npm test
  cd ..
fi