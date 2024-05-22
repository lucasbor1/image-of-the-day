# Estágio 0: Clonar o repositório do GitHub
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/lucasbor1/image-of-the-day

RUN git config --global user.email "lucas-borges2000@hotmail.com"
RUN git config --global user.name "Lucas Borges"

# Estágio 1: Construir a aplicação
FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app
COPY --from=clone /app/image-of-the-day /app
RUN mvn clean install

# Estágio 2: Executar a aplicação
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /app
CMD ["java", "-jar", "/app/my-app-1.0-SNAPSHOT.jar"]
