# wild-truffle

`wild-truffle` makes it straightforward to run unpublished Truffle and Ganache changes against a selection of existing commercial Truffle projects:
+ [zeppelin-solidity] (at commit )
+ [aragonOS] (at commit )
+ [colonyNetwork] (at commit)

The repo's goal is to deepen Truffle's testing regime to include an ~800 unit test battery that reflects real usage of the toolset.

# Install

```
npm install
```

# Use

Exercise an experimental Truffle branch (this can span several modules) against the projects listed above on Travis CI and see what breaks:

```shell

git checkout -b <throw-away-branch-name>  # checkout a throw-away branch.

npm run ci <experimental-branch>          # Run the truffle branch in CI (defaults to `develop`).
```






