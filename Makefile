.PHONY: all
all: dependencies tests

.PHONY: clean
clean:
	git clean -xdf -e .venv

.PHONY: dependencies
dependencies:

.PHONY: tests
tests: