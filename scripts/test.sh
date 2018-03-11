#!/usr/bin/env bash

npm run build
chmod +x build/cli.bundled.js

cd zeppelin-solidity
npm test
cd ..