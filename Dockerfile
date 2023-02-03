FROM ubuntu:jammy

RUN apt-get update \
  && apt-get -y install \
    curl \
    nano \
    unzip \
    sudo \
    git \
    openssh-client \
    openssh-server
    
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

RUN useradd -u 1000 -s /bin/bash -m devpod

RUN mkdir -p /home/devpod/.ssh
RUN touch /home/devpod/.ssh/known_hosts
RUN chown -Rf devpod:devpod /home/devpod/.ssh

COPY init.sh /root
RUN chmod +x /root/init.sh

EXPOSE 22

ENTRYPOINT ["/root/init.sh"]
