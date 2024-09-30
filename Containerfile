# Build
FROM registry.access.redhat.com/ubi8/openjdk-17 as builder

COPY pom.xml .
COPY src src

RUN mvn -B package

# Run
FROM registry.access.redhat.com/ubi8/openjdk-17-runtime

COPY --from=builder /home/jboss/target/hello-1.0-jar-with-dependencies.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "hello-1.0-jar-with-dependencies.jar"]