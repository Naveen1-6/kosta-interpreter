# Use official Maven image to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS builder

COPY . .
RUN mvn clean package -DskipTests

# -------------------------
# Final runtime image
# -------------------------
FROM eclipse-temurin:17-jdk-alpine


COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

