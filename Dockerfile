FROM fedora:34

EXPOSE 8080
VOLUME ["/tmp"]

RUN yum update -y
