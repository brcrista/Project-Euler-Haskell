# Project Euler

[![GitHub Actions build badge](https://github.com/brcrista/Project-Euler-Haskell/workflows/CI/badge.svg)](https://github.com/brcrista/Project-Euler-Haskell/actions?query=workflow%3ACI)

<https://projecteuler.net>

## Prerequisities

Install [Stack](https://docs.haskellstack.org/en/stable/README/).

### Windows

[Install WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10), which 
is [needed to run Cabal](https://github.com/haskell/cabal/issues/6551).

## Checking solutions

The tests run on the [Tasty](https://hackage.haskell.org/package/tasty) framework.
The test functions follow the naming convention for [`tasty-discover`](https://hackage.haskell.org/package/tasty-discover).

To build the project and run all tests, do

```bash
make
```