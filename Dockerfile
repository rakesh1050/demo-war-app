FROM openjdk:17-jdk-slim
WORKDIR /app
ARG JAR_FILE=target/demo-war-app.jar
COPY ${JAR_FILE} .
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/demo-war-app.jar"]
