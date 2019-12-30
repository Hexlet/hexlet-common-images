FROM composer:1.9.0

WORKDIR /linter

RUN apk add --no-cache gwenhywfar

COPY composer.json composer.json
RUN composer install

COPY linter /linter
COPY phpcs.xml /linter
# RUN chmod +x linter

VOLUME /tmp

CMD ./linter
