FROM maven:3.2-jdk-7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD . /usr/src/app

RUN git clone https://github.com/abrensch/brouter.git
RUN cd brouter && mvn clean install -pl brouter-server -am

CMD java -cp brouter/brouter-server/target/brouter-server-1.2-jar-with-dependencies.jar btools.server.RouteServer segments profiles customprofiles 17777 4
