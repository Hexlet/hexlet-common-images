build: build-php build-js build-java build-null build-sql build-python-flake8 build-stylelint

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

build-stylelint:
	docker build -t hexlet/common-stylelint stylelint

bash:
	docker run -it -v $(CURDIR)/$(N)/app:/usr/src/app --read-only hexlet/common-$(N) /bin/bash

push:
	docker push hexlet/common-$(N)

lint-js:
	docker run -t --read-only -v $(CURDIR)/eslint/app:/usr/src/app \
	  -v $(CURDIR)/eslint/package.json:/linter/package.json \
	  -v $(CURDIR)/eslint/.eslintrc.yml:/linter/.eslintrc.yml \
	  -v $(CURDIR)/eslint/linter:/linter/linter \
	  hexlet/common-eslint

lint-php:
	docker run -t --read-only -v $(CURDIR)/phpcs/app:/usr/src/app \
	  -v $(CURDIR)/phpcs/linter:/linter/linter \
	  -v $(CURDIR)/phpcs/composer.json:/phpcs/composer.json \
	  hexlet/common-phpcs

lint-sql:
	docker run -t --read-only -v $(CURDIR)/sqlint/app:/usr/src/app \
	  -v $(CURDIR)/sqlint/linter:/linter/linter \
	  hexlet/common-sqlint

lint-python-flake8:
	docker run -t --read-only -v $(CURDIR)/python-flake8/app:/usr/src/app \
	  -v $(CURDIR)/python-flake8/linter:/linter/linter \
	  -v $(CURDIR)/python-flake8/setup.cfg:/linter/setup.cfg \
	  hexlet/common-python-flake8

lint-css:
	docker run -t --read-only -v $(CURDIR)/stylelint/app:/usr/src/app \
	  -v $(CURDIR)/stylelint/package.json:/linter/package.json \
	  -v $(CURDIR)/stylelint/.stylelintrc.yaml:/linter/.stylelintrc.yaml \
	  -v $(CURDIR)/stylelint/linter:/linter/linter \
	  hexlet/common-stylelint
