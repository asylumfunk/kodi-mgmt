#!/usr/bin/make -f
BIN_DIR = ./bin
MYPY_BIN = mypy
MYPY = $(MYPY_BIN) --config-file '$(MYPY_CONFIG)'
MYPY_CONFIG = pyproject.toml
PY_FILES = $(shell grep --files-with-match '#!/usr/bin/env python' bin/*)
PIP = pip
PYLINT_BIN = pylint
PYLINT = $(PYLINT_BIN)
PIP_TEST_REQUIREMENTS = etc/test-requirements.txt

.PHONY: all
all: test

.PHONY: test
test: test-type test-lint

.PHONY: test-requirements
test-requirements:
	$(PIP) install -r $(PIP_TEST_REQUIREMENTS)

.PHONY: test-type
test-type:
	$(MYPY) $(PY_FILES)
	$(MYPY) --py2 $(PY_FILES)

.PHONY: test-lint
test-lint:
	$(PYLINT) $(PY_FILES)
