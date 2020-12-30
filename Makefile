.PHONY: all
all:
	cabal update
	cabal run all

.PHONY: clean
clean:
	git clean -xdf -e .venv