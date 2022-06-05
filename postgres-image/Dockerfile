FROM registry.redhat.io/rhel8/postgresql-12:latest
WORKDIR /root
RUN curl -LJO https://github.com/fullstorydev/grpcurl/releases/download/v1.8.6/grpcurl_1.8.6_linux_x86_64.tar.gz
RUN tar zxvf grpcurl_1.8.6_linux_x86_64.tar.gz
RUN cp grpcurl_1.8.6_linux_x86_64/grpcurl /usr/bin/grpcurl

