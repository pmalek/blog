
# ------------------------------------------------------------------------------
# Configuration - Make
# ------------------------------------------------------------------------------

# Some sensible Make defaults: https://tech.davis-hansson.com/p/make/
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

# ------------------------------------------------------------------------------
# Configuration - Tools
# ------------------------------------------------------------------------------

TOOLS_VERSIONS_FILE = .tools_versions.yaml
PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
export MISE_DATA_DIR = $(PROJECT_DIR)/bin/
MISE := $(shell which mise)

.PHONY: mise
mise:
	@mise -V >/dev/null || (echo "mise - https://github.com/jdx/mise - not found. Please install it." && exit 1)

# NOTE: mise targets use -q to silence the output.
# Users can use MISE_VERBOSE=1 MISE_DEBUG=1 to get more verbose output.

.PHONY: mise-plugin-install
mise-plugin-install: mise
	@$(MISE) plugin install --yes -q $(DEP) $(URL)

.PHONY: mise-install
mise-install: mise
	@$(MISE) install -q $(DEP_VER)

HUGO_VERSION = $(shell yq -ojson -r '.hugo' < $(TOOLS_VERSIONS_FILE))
HUGO = $(PROJECT_DIR)/bin/installs/hugo/$(HUGO_VERSION)/bin/hugo
.PHONY: hugo
hugo: mise
	@$(MAKE) mise-plugin-install DEP=hugo
	$(MAKE) mise-install DEP_VER=hugo@$(HUGO_VERSION)

# ------------------------------------------------------------------------------
# Configuration - Build
# ------------------------------------------------------------------------------

BASE_URL ?= blog.pmalek.dev

.PHONY: run
run: hugo
	$(HUGO) server --buildDrafts --disableFastRender

.PHONY: build
build: hugo
	$(HUGO) build --minify --gc --baseURL=$(BASE_URL)
