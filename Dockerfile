From maven:3.6.0-jdk-13

CMD [ "mvn", "--version"]

COPY maven-WebApp /

CMD [ "mvn", "package"]
