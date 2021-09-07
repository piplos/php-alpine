SHELL := /bin/bash
ALL: build
.PHONY: build test push

IMAGE := piplosmedia/php-fpm
VERSION ?= latest
PHP_VERSION = $(firstword $(subst -, ,$(VERSION)))

build:
	@echo " =====> Building $(IMAGE):$(VERSION)..."
	@dir="$(subst -,/,$(VERSION))"; \
	if [[ "$(VERSION)" == 'latest' ]]; then \
		dir='.'; \
	fi; \
	docker image build --quiet -t $(IMAGE):$(VERSION) $${dir}

test:
	@echo -e "=====> Testing loaded extensions... \c"
	@if [[ -z `docker image ls $(IMAGE) | grep "\s$(VERSION)\s"` ]]; then \
		echo 'FAIL [Missing image!!!]'; \
		exit 1; \
	fi
	@if [[ -z `docker container run --rm $(IMAGE):$(VERSION) composer --version 2> /dev/null | grep '^Composer version 2\.[0-9][0-9]*'` ]]; then \
		echo 'FAIL [Composer 2]'; \
		exit 1; \
	fi
	@echo 'OK'

push:
	docker image push $(IMAGE):$(VERSION)
