FROM maven:3.8.7-eclipse-temurin-19 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:19-jdk-slim
COPY --from=build /target/my_spring_socket-0.0.1-SNAPSHOT.jar my_spring_socket.jar

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "my_spring_socket.jar" ]