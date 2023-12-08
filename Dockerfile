FROM maven:3.8.3-openjdk-11-slim AS build
WORKDIR /
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
COPY --from=build /target/johnuno-0.1.0.jar /myapp.jar
EXPOSE 8080
CMD ["java", "-jar", "/myapp.jar"]