FROM openjdk:11.0.12-jdk-slim-buster as step01
WORKDIR /src
COPY . .
RUN mvnw package

FROM openjdk:11.0.12-jre-slim-buster
WORKDIR /app
COPY --from=step01 /src/target/demo-0.0.1-SNAPSHOT.jar ./demo.jar
EXPOSE 8080
CMD [ "java", "-jar", "/app/demo.jar" ]
