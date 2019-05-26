from maven as base
copy pom.xml /opt/
workdir /opt
run mvn dependency:resolve
copy . /opt/
run mvn package

from openjdk
copy --from=base /opt/target/spring-boot-docker-0.1.0.jar /app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]






