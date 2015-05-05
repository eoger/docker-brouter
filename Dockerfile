FROM maven:3.2-jdk-7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ONBUILD ADD . /usr/src/app

ONBUILD RUN git clone https://github.com/abrensch/brouter.git
ONBUILD RUN cd brouter && mvn clean install -pl brouter-server -am

EXPOSE 17777

CMD java -cp brouter/brouter-server/target/brouter-server-1.2-jar-with-dependencies.jar btools.server.RouteServer segments profiles customprofiles 17777 4
