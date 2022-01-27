FROM maven:3.5-jdk-8-alpine as build
ADD . .
RUN mvn install -DskipTests

FROM tomcat:8
COPY --from=build /target/spring-boot-rest-api-tutorial-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/spring-boot-rest-api-tutorial-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["catalina.sh","run"]
