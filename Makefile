build: build-php build-js build-java build-null build-sql build-python-flake8 build-layout-designer-lint

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

bash:
	docker run -it -v $(CURDIR)/$(N)/app:/usr/src/app --read-only hexlet/common-$(N) /bin/bash

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
	docker run -t --read-only -v $(CURDIR)/phpcs/app:/usr/src/app \
	  -v $(CURDIR)/phpcs/linter:/linter/linter \
	  -v $(CURDIR)/phpcs/composer.json:/phpcs/composer.json \
	  hexlet/common-phpcs

lint-sql:
	docker run -t --read-only -v $(CURDIR)/sqlint/app:/usr/src/app \
	  -v $(CURDIR)/sqlint/linter:/linter/linter \
	  -v $(CURDIR)/sqlint/setup.cfg:/linter/setup.cfg \
	  hexlet/common-sqlint

lint-python-flake8:
	docker run -t --read-only -v $(CURDIR)/python-flake8/app:/usr/src/app \
	  -v $(CURDIR)/python-flake8/linter:/linter/linter \
	  -v $(CURDIR)/python-flake8/setup.cfg:/linter/setup.cfg \
	  hexlet/common-python-flake8

lint-layout-designer:
	docker run -t --read-only -v $(CURDIR)/layout-designer-lint/app:/usr/src/app \
	  -v $(CURDIR)/layout-designer-lint/package.json:/linter/package.json \
	  -v $(CURDIR)/layout-designer-lint/.stylelintrc:/linter/.stylelintrc \
	  -v $(CURDIR)/layout-designer-lint/.htmlhintrc:/linter/.htmlhintrc \
	  -v $(CURDIR)/layout-designer-lint/linter:/linter/linter \
	  hexlet/common-layout-designer-lint

lint-java:
	docker run -t --read-only -v $(CURDIR)/checkstyle/app:/usr/src/app \
	  -v $(CURDIR)/checkstyle/google_checks_hexlet_edition.xml:/linter/google_checks_hexlet_edition.xml \
	  -v $(CURDIR)/checkstyle/linter:/linter/linter \
	  hexlet/common-checkstyle

lint-ruby:
	docker run -t --read-only -v $(CURDIR)/rubocop/app:/usr/src/app \
		-v $(CURDIR)/rubocop/linter:/linter/linter \
		-v $(CURDIR)/rubocop/Gemfile:/linter/Gemfile \
		-v $(CURDIR)/rubocop/.rubocop.yml:/linter/.rubocop.yml \
		hexlet/common-rubocop
