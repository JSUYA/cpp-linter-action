Github action for linting the C++ code.
Uses cpplint

Example of usage:
```
name: PullRequest_Coding_Style_Check

on:
  pull_request:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: cpp checker check
        uses: jsuya/cpp-linter-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
