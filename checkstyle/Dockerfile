FROM openjdk:15-slim

RUN apt-get -y update
RUN apt-get install -y wget

WORKDIR /linter

COPY linter linter
RUN chmod +x linter

COPY google_checks_hexlet_edition.xml google_checks_hexlet_edition.xml

RUN wget --quiet "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.32/checkstyle-8.32-all.jar" -O checkstyle.jar

ADD app /usr/src/app

CMD ./linter
