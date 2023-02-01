FROM ubuntu:jammy

RUN apt-get update \
  && apt-get -y install \
    curl \
    nano \
    unzip \
    sudo \
    openssh-client \
    openssh-server

COPY init.sh /root

EXPOSE 2222

VOLUME /config

ENTRYPOINT ["/root/init.sh"]
