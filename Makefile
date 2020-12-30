.PHONY: all
all:
	cabal run all

.PHONY: clean
clean:
	git clean -xdf -e .venv