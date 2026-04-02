FROM eclipse-temurin:17-jre

WORKDIR /app

ENV TZ=Asia/Shanghai
ENV JAVA_OPTS=""

COPY target/demo-java-service-1.0.0.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app/app.jar"]
