FROM maven:3.9-eclipse-temurin-8 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:8-jre

WORKDIR /app

COPY --from=build /app/target/shipping-1.0.jar shipping.jar

EXPOSE 8080

CMD ["java","-jar","shipping.jar"]