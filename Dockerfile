FROM maven:3.2-jdk-7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/abrensch/brouter.git
RUN cd brouter && mvn clean install -pl brouter-server -am

EXPOSE 17777

ONBUILD COPY . /usr/src/app

CMD java Xmx128M -Xms128M -Xmn8M -DmaxRunningTime=300 -cp brouter/brouter-server/target/brouter-server-1.2-jar-with-dependencies.jar btools.server.RouteServer segments profiles customprofiles 17777 1
