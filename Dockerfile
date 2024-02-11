FROM quay.io/centos/centos:stream8

# Presto version will be passed in at build time
ARG PRESTO_VERSION
ARG PRESTO_BIN=https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz

##Update OS and Dependencies##
#USER root
RUN dnf install -y java-11-openjdk less procps python3 \
    && dnf install wget \
    && ln -s $(which python3) /usr/bin/python \
    && mv /etc/yum/protected.d/systemd.conf /etc/yum/protected.d/systemd.conf.bak \
    && dnf clean all

RUN wget --quiet ${PRESTO_BIN}
RUN mkdir -p /opt
RUN tar -xf presto-server-${PRESTO_VERSION}.tar.gz -C /opt
RUN rm presto-server-${PRESTO_VERSION}.tar.gz
RUN ln -s /opt/presto-server-${PRESTO_VERSION} /opt/presto


# Copy configuration files on the host into the image
# COPY etc /opt/presto/etc

ARG PRESTO_CLI_BIN=https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${PRESTO_VERSION}/presto-cli-${PRESTO_VERSION}-executable.jar
RUN wget --quiet "${PRESTO_CLI_BIN}"
RUN mv presto-cli-${PRESTO_VERSION}-executable.jar /usr/local/bin/presto
RUN chmod +x /usr/local/bin/presto
RUN mkdir /opt/presto/data
RUN mkdir /opt/presto/log

# Specify the entrypoint to start
CMD ["/opt/presto/bin/launcher", "run"]