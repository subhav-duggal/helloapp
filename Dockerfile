FROM centos/systemd

MAINTAINER "Akash Gautam" <akash.gautam@velotio.com>

COPY hello-app  /

ENTRYPOINT ["/hello-app"]