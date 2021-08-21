FROM openjdk:15-slim

RUN apt-get -y update
RUN apt-get install -y wget

WORKDIR /linter

COPY linter .

COPY google_checks_hexlet_edition.xml google_checks_hexlet_edition.xml

RUN wget --quiet "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.45.1/checkstyle-8.45.1-all.jar" -O checkstyle.jar

ADD app /usr/src/app

CMD ./linter
