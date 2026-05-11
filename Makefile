#!/usr/bin/make -f
BIN_DIR = ./bin
MYPY_BIN = mypy
MYPY = $(MYPY_BIN) --config-file '$(MYPY_CONFIG)'
MYPY_CONFIG = pyproject.toml
PY_FILES = $(shell grep --files-with-match '#!/usr/bin/env python' bin/*)
PYLINT = pylint

.PHONY: all
all: test

.PHONY: test
test:
	$(MYPY) $(PY_FILES)
	$(MYPY) --py2 $(PY_FILES)
	$(PYLINT) $(PY_FILES)
