FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y

WORKDIR /home/source/
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
WORKDIR /home/source/App42PaaS-Java-MySQL-Sample/

RUN echo "app42.paas.db.username = appuser" > WebContent/Config.properties
RUN echo "app42.paas.db.port = 3306" >> WebContent/Config.properties
RUN echo "app42.paas.db.password = 12345" >> WebContent/Config.properties
RUN echo "app42.paas.db.ip = db" >> WebContent/Config.properties
RUN echo "app42.paas.db.name = core" >> WebContent/Config.properties

#Build app
RUN mvn package