.PHONY: all
all: dependencies build tests

.PHONY: clean
clean:
	git clean -xdf -e .venv

.PHONY: dependencies
dependencies:
	stack update

.PHONY: build
build:
	stack build

.PHONY: tests
tests:
	doctest src
	stack test