FROM openjdk:17-slim

RUN apt-get update && apt-get install -yq wget

WORKDIR /linter

RUN wget -q "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-9.2/checkstyle-9.2-all.jar" -O checkstyle.jar

COPY linter .
COPY sun_checks_hexlet_edition.xml .

CMD ./linter
