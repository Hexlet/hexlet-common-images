REGISTRY := cr.yandex/crpa5i79t7oiqnj0ap8g

build: build-php build-js build-java build-null build-sql build-python-flake8 build-layout-designer-lint build-multi-language build-go build-python-ruff

build-multi-language:
	docker build -t $(REGISTRY)/common-multi-language multi-language

build-php:
	docker build -t $(REGISTRY)/common-phpcs phpcs

build-sql:
	docker build -t $(REGISTRY)/common-sqlint sqlint

build-js:
	docker build -t $(REGISTRY)/common-eslint eslint

build-java:
	docker build -t $(REGISTRY)/common-checkstyle checkstyle

build-null:
	docker build -t $(REGISTRY)/common-nulllint nulllint

build-python-flake8:
	docker build -t $(REGISTRY)/common-python-flake8 python-flake8

build-python-ruff:
	docker build -t $(REGISTRY)/common-python-ruff python-ruff

build-layout-designer-lint:
	docker build -t $(REGISTRY)/common-layout-designer-lint layout-designer-lint

build-ruby:
	docker build -t $(REGISTRY)/common-rubocop rubocop

build-go:
	docker build -t $(REGISTRY)/common-golangci-lint golangci-lint

bash:
	docker run --rm -it -v $(CURDIR)/$(N)/app:/usr/src/app --read-only $(REGISTRY)/common-$(N) /bin/bash

push:
	docker push $(REGISTRY)/common-$(N)

lint-js:
	docker run --rm -it --read-only -v $(CURDIR)/eslint/app:/usr/src/app \
		-v $(CURDIR)/eslint/package.json:/linter/package.json \
		-v $(CURDIR)/eslint/eslint.config.js:/linter/eslint.config.js \
		-v $(CURDIR)/eslint/tsconfig.json:/linter/tsconfig.json \
		-v $(CURDIR)/eslint/linter:/linter/linter \
		$(REGISTRY)/common-eslint

lint-php:
	docker run --rm -t --read-only -v $(CURDIR)/phpcs/app:/usr/src/app \
		-v $(CURDIR)/phpcs/linter:/linter/linter \
		-v $(CURDIR)/phpcs/composer.json:/phpcs/composer.json \
		$(REGISTRY)/common-phpcs

lint-sql:
	docker run --rm -t --read-only -v $(CURDIR)/sqlint/app:/usr/src/app \
		-v $(CURDIR)/sqlint/linter:/linter/linter \
		-v $(CURDIR)/sqlint/setup.cfg:/linter/setup.cfg \
		$(REGISTRY)/common-sqlint

lint-python-flake8:
	docker run --rm -t --read-only -v $(CURDIR)/python-flake8/app:/usr/src/app \
		-v $(CURDIR)/python-flake8/linter:/linter/linter \
		-v $(CURDIR)/python-flake8/setup.cfg:/linter/setup.cfg \
		$(REGISTRY)/common-python-flake8

lint-python-ruff:
	docker run --rm -t --read-only -v $(CURDIR)/python-ruff/app:/usr/src/app \
		-v $(CURDIR)/python-ruff/linter:/linter/linter \
		-v $(CURDIR)/python-ruff/ruff.toml:/linter/ruff.toml \
		-v /var/tmp/.ruff_cache \
		$(REGISTRY)/common-python-ruff


lint-layout-designer:
	docker run --rm -t --read-only -v $(CURDIR)/layout-designer-lint/app:/usr/src/app \
		-v $(CURDIR)/layout-designer-lint/package.json:/linter/package.json \
		-v $(CURDIR)/layout-designer-lint/.stylelintrc:/linter/.stylelintrc \
		-v $(CURDIR)/layout-designer-lint/.htmlhintrc:/linter/.htmlhintrc \
		-v $(CURDIR)/layout-designer-lint/.pug-lintrc:/linter/.pug-lintrc \
		-v $(CURDIR)/layout-designer-lint/linter:/linter/linter \
		$(REGISTRY)/common-layout-designer-lint

lint-java:
	docker run --rm -t --read-only -v $(CURDIR)/checkstyle/app:/usr/src/app \
		-v $(CURDIR)/checkstyle/sun_checks_hexlet_edition.xml:/linter/sun_checks_hexlet_edition.xml \
		-v $(CURDIR)/checkstyle/linter:/linter/linter \
		$(REGISTRY)/common-checkstyle

lint-ruby:
	docker run --rm -t --read-only -v $(CURDIR)/rubocop/app:/usr/src/app \
		-v $(CURDIR)/rubocop/linter:/linter/linter \
		-v $(CURDIR)/rubocop/Gemfile:/linter/Gemfile \
		-v $(CURDIR)/rubocop/.rubocop.yml:/linter/.rubocop.yml \
		$(REGISTRY)/common-rubocop

lint-multi-language:
	docker run --rm -t --read-only -v $(CURDIR)/multi-language/app:/usr/src/app \
		-v $(CURDIR)/multi-language/package.json:/linter/package.json \
		-v $(CURDIR)/multi-language/eslint.config.js:/linter/eslint.config.js \
		-v $(CURDIR)/multi-language/composer.json:/phpcs/composer.json \
		-v $(CURDIR)/multi-language/setup.cfg:/linter/setup.cfg \
		-v $(CURDIR)/multi-language/sun_checks_hexlet_edition.xml:/linter/sun_checks_hexlet_edition.xml.xml \
		-v $(CURDIR)/multi-language/linter:/linter/linter \
		$(REGISTRY)/common-multi-language

lint-golangci:
	docker run --rm -t --read-only -v $(CURDIR)/golangci-lint/app:/usr/src/app \
		-v $(CURDIR)/golangci-lint/linter:/linter/linter \
		-v $(CURDIR)/golangci-lint/.golangci.yml:/linter/.golangci.yml \
		-v /var/tmp/.cache \
		$(REGISTRY)/common-golangci-lint
