FROM maven:3.8.1-openjdk-8-slim

RUN apt-get update
RUN apt-get install git -y

#WORKDIR /home/source/
WORKDIR /usr/src/mymaven/source/
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
#WORKDIR /home/source/App42PaaS-Java-MySQL-Sample/
WORKDIR /usr/src/mymaven/source/App42PaaS-Java-MySQL-Sample/

RUN echo "app42.paas.db.username = appuser" > WebContent/Config.properties
RUN echo "app42.paas.db.port = 3306" >> WebContent/Config.properties
RUN echo "app42.paas.db.password = 12345" >> WebContent/Config.properties
RUN echo "app42.paas.db.ip = db" >> WebContent/Config.properties
RUN echo "app42.paas.db.name = core" >> WebContent/Config.properties

RUN mvn package