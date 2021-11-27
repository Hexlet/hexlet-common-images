FROM ubuntu:21.10

RUN apt-get update && apt-get install -yq ruby

ENV GEM_HOME /linter/vendor/bundler

RUN gem install rubocop rubocop-minitest rubocop-rails

WORKDIR /linter

COPY linter .
COPY .rubocop.yml .

CMD ./linter
