FROM fedora:34

RUN yum update -y
RUN yum install -y subversion-javahl
RUN yum install -y java-11-openjdk-devel
RUN yum install -y maven
RUN yum clean all
EXPOSE 8080

COPY pom.xml .
COPY src src

RUN mvn package --no-transfer-progress

ENV JAVA_TOOL_OPTIONS -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n
ENTRYPOINT ["sh", "-c", "java -jar target/svn-web-service-0.1.0.jar"]
