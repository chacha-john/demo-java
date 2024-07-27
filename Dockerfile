FROM maven:3.9.8-eclipse-temurin-17 as builder
WORKDIR /app
COPY . .
RUN mvn -B dependency:resolve-plugins dependency:resolve
RUN mvn clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY  --from=builder /app/target/*.jar /app/app.jar
CMD ["java","-jar","app.jar"]
