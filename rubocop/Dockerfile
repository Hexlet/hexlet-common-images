FROM ruby:3.0.1

WORKDIR /linter

RUN apt-get update
RUN apt-get install -y xvfb unzip


RUN bundle config set --local path '/linter/vendor/bundle'
RUN bundle config set --local bin '/linter/vendor/bundle/bin'

COPY Gemfile Gemfile
RUN bundle install

VOLUME /tmp

CMD ./linter
