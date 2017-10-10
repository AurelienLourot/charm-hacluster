#!/usr/bin/make
PYTHON := /usr/bin/env python

lint:
	@tox -e pep8

test:
	@# Starting unit tests
	@tox -e py27

functional_test:
	@echo Starting Amulet tests
	@tox -e func27

bin/charm_helpers_sync.py:
	@mkdir -p bin
	@bzr cat lp:~openstack-charmers/charm-helpers/stable/tools/charm_helpers_sync/charm_helpers_sync.py \
	> bin/charm_helpers_sync.py

sync: bin/charm_helpers_sync.py
	@$(PYTHON) bin/charm_helpers_sync.py -c charm-helpers-hooks.yaml
	@$(PYTHON) bin/charm_helpers_sync.py -c charm-helpers-tests.yaml
