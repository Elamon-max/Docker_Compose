# 1-BOSQICH: BUILDER
FROM maven:3.6.3-jdk-8-slim AS build

WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN chmod +x mvnw

RUN ./mvnw dependency:go-offline

COPY src ./src
RUN ./mvnw package -DskipTests

# 2-BOSQICH: RUNTIME
FROM bellsoft/liberica-openjdk-alpine:8

WORKDIR /app

RUN apk add --no-cache bash

COPY --from=build /app/target/*.jar app.jar

COPY wait-for-it.sh .
RUN chmod +x wait-for-it.sh

ENTRYPOINT ["./wait-for-it.sh", "postgres:5432", "--", "java", "-jar", "app.jar"]