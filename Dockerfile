# Estágio 1: Clonar o repositório do GitHub
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/lucasbor1/image-of-the-day.git .

# Estágio 2: Construir a aplicação usando Maven
FROM maven:3.6.0-jdk-11-slim AS build
COPY --from=clone /app /app
WORKDIR /app
RUN mvn clean install

# Estágio 3: Executar a aplicação
FROM openjdk:11-jre-slim
COPY --from=build /app/target/image-of-the-day.jar /app/
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "image-of-the-day.jar"]
