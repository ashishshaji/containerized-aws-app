FROM eclipse-temurin:17-jre

WORKDIR /app

# run as a non-root user
RUN useradd --system --no-create-home appuser

# JAR built by "mvn clean package" (Spring Boot fat JAR in target/)
COPY target/*.jar app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
