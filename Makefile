build: build-php build-js build-java build-null build-sql build-python-flake8 build-layout-designer-lint build-multi-language build-go

build-multi-language:
	docker build -t hexlet/common-multi-language multi-language

build-php:
	docker build -t hexlet/common-phpcs phpcs

build-sql:
	docker build -t hexlet/common-sqlint sqlint

build-js:
	docker build -t hexlet/common-eslint eslint

build-java:
	docker build -t hexlet/common-checkstyle checkstyle

build-null:
	docker build -t hexlet/common-nulllint nulllint

build-python-flake8:
	docker build -t hexlet/common-python-flake8 python-flake8

build-layout-designer-lint:
	docker build -t hexlet/common-layout-designer-lint layout-designer-lint

build-ruby:
	docker build -t hexlet/common-rubocop rubocop

build-go:
	docker build -t hexlet/common-golangci-lint golangci-lint

bash:
	docker run --rm -it -v $(CURDIR)/$(N)/app:/usr/src/app --read-only hexlet/common-$(N) /bin/bash

push:
	docker push hexlet/common-$(N)

lint-js:
	docker run -t --read-only -v $(CURDIR)/eslint/app:/usr/src/app \
	  -v $(CURDIR)/eslint/package.json:/usr/src/linter/package.json \
	  -v $(CURDIR)/eslint/.eslintrc.yml:/usr/src/linter/.eslintrc.yml \
		-v $(CURDIR)/eslint/tsconfig.json:/usr/src/linter/tsconfig.json \
		-v $(CURDIR)/eslint/tsconfig.eslint.json:/usr/src/linter/tsconfig.eslint.json \
	  -v $(CURDIR)/eslint/linter:/usr/src/linter/linter \
	  hexlet/common-eslint

lint-php:
	docker run --rm -t --read-only -v $(CURDIR)/phpcs/app:/usr/src/app \
	  -v $(CURDIR)/phpcs/linter:/linter/linter \
	  -v $(CURDIR)/phpcs/composer.json:/phpcs/composer.json \
	  hexlet/common-phpcs

lint-sql:
	docker run --rm -t --read-only -v $(CURDIR)/sqlint/app:/usr/src/app \
	  -v $(CURDIR)/sqlint/linter:/linter/linter \
	  -v $(CURDIR)/sqlint/setup.cfg:/linter/setup.cfg \
	  hexlet/common-sqlint

lint-python-flake8:
	docker run --rm -t --read-only -v $(CURDIR)/python-flake8/app:/usr/src/app \
	  -v $(CURDIR)/python-flake8/linter:/linter/linter \
	  -v $(CURDIR)/python-flake8/setup.cfg:/linter/setup.cfg \
	  hexlet/common-python-flake8

lint-layout-designer:
	docker run --rm -t --read-only -v $(CURDIR)/layout-designer-lint/app:/usr/src/app \
	  -v $(CURDIR)/layout-designer-lint/package.json:/linter/package.json \
	  -v $(CURDIR)/layout-designer-lint/.stylelintrc:/linter/.stylelintrc \
	  -v $(CURDIR)/layout-designer-lint/.htmlhintrc:/linter/.htmlhintrc \
	  -v $(CURDIR)/layout-designer-lint/.pug-lintrc:/linter/.pug-lintrc \
	  -v $(CURDIR)/layout-designer-lint/linter:/linter/linter \
	  hexlet/common-layout-designer-lint

lint-java:
	docker run --rm -t --read-only -v $(CURDIR)/checkstyle/app:/usr/src/app \
	  -v $(CURDIR)/checkstyle/sun_checks_hexlet_edition.xml:/linter/sun_checks_hexlet_edition.xml \
	  -v $(CURDIR)/checkstyle/linter:/linter/linter \
	  hexlet/common-checkstyle

lint-ruby:
	docker run --rm -t --read-only -v $(CURDIR)/rubocop/app:/usr/src/app \
		-v $(CURDIR)/rubocop/linter:/linter/linter \
		-v $(CURDIR)/rubocop/Gemfile:/linter/Gemfile \
		-v $(CURDIR)/rubocop/.rubocop.yml:/linter/.rubocop.yml \
		hexlet/common-rubocop

lint-multi-language:
	docker run --rm -t --read-only -v $(CURDIR)/multi-language/app:/usr/src/app \
		-v $(CURDIR)/multi-language/package.json:/linter/package.json \
		-v $(CURDIR)/multi-language/.eslintrc.yml:/linter/.eslintrc.yml \
		-v $(CURDIR)/multi-language/composer.json:/phpcs/composer.json \
		-v $(CURDIR)/multi-language/setup.cfg:/linter/setup.cfg \
		-v $(CURDIR)/multi-language/sun_checks_hexlet_edition.xml:/linter/sun_checks_hexlet_edition.xml.xml \
		-v $(CURDIR)/multi-language/linter:/linter/linter \
		hexlet/common-multi-language
	
lint-golangci:
	docker run --rm -t --read-only -v $(CURDIR)/golangci-lint/app:/usr/src/app \
		-v $(CURDIR)/golangci-lint/linter:/linter/linter \
		-v $(CURDIR)/golangci-lint/.golangci.yml:/linter/.golangci.yml \
		-v /var/tmp/.cache \
		hexlet/common-golangci-lint
