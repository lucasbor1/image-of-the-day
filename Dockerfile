# Estágio 1: Construir a aplicação
FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean install

# Estágio 2: Executar a aplicação
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /app
CMD ["java", "-jar", "/app/my-app-1.0-SNAPSHOT.jar"]
