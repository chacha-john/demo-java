FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY  ./target/*.jar /app/app.jar
CMD ["java","-jar","app.jar"]
