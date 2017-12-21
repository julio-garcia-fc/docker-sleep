FROM centos:7

RUN yum -y upgrade && \
    yum -y install wget nc && \
    yum clean all && \
    wget -qO /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 && \
    chmod +x /usr/local/bin/dumb-init && \
    yum clean all && \
    rm -rf /var/cache/yum /var/cache/man /var/cache/abrt-di

ENTRYPOINT ["/usr/local/bin/dumb-init"]

CMD ["nc", "-l", "8088"]
