FROM composer:1.8.6

WORKDIR /linter

COPY composer.json composer.json
RUN composer install

COPY linter /linter
# RUN chmod +x linter

VOLUME /tmp

CMD ./linter
