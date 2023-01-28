From ubuntu:lunar

RUN apt-get update -y && apt-get -y upgrade

RUN apt-get install wget -y

RUN apt install openjdk-11-jdk -y

RUN java -version && javac -version

RUN apt-get install maven -y

RUN mvn --version

RUN mkdir /opt/tomcat

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz -O /tmp/tomcat.tar.gz

RUN cd /tmp && tar xvfz tomcat.tar.gz

RUN cp -R /tmp/apache-tomcat-9.0.71/* /opt/tomcat/

WORKDIR /home/maven/

COPY . /home/maven

RUN  mvn package

RUN cp /home/maven/target/*.war /opt/tomcat/webapps

EXPOSE 9090

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
