.PHONY: all
all: dependencies
	cabal v2-update
	cabal v2-run all

.PHONY: clean
clean:
	git clean -xdf -e .venv

.PHONY: dependencies
dependencies:
	cabal v2-install --lib HUnit