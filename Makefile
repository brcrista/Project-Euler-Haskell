.PHONY: all
all: dependencies
	cabal update
	cabal run all

.PHONY: clean
clean:
	git clean -xdf -e .venv

.PHONY: dependencies
dependencies:
	cabal install --lib HUnit