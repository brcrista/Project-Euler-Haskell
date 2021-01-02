# Project Euler

[![GitHub Actions build badge](https://github.com/brcrista/Project-Euler-Haskell/workflows/CI/badge.svg)](https://github.com/brcrista/Project-Euler-Haskell/actions?query=workflow%3ACI)

<https://projecteuler.net>

## Prerequisities

Install GHC and Cabal.

### macOS

```bash
brew install cabal-install
```

### Debian

Follow the instructions at

<https://downloads.haskell.org/~debian/>

and add `/opt/ghc/bin` to `PATH`.

### Windows

[Install WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and follow the instructions above for Debian.
- WSL 2 is [needed to run Cabal](https://github.com/haskell/cabal/issues/6551).

## Checking solutions

```bash
make
```