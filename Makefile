.PHONY: all
all: dependencies build tests

.PHONY: clean
clean:
	git clean -xdf -e .venv

.PHONY: dependencies
dependencies:
	cabal update
	cabal install --lib HUnit

.PHONY: build
	cabal build

.PHONY: tests
tests:
	cabal test