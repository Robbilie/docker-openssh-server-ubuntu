FROM ubuntu:jammy

RUN apt-get update \
  && apt-get -y install \
    curl \
    nano \
    unzip \
    sudo \
    openssh-client \
    openssh-server
    
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

RUN useradd -u 1000 devpod

RUN mkdir -p /home/devpod/.ssh

COPY init.sh /root
RUN chmod +x /root/init.sh

EXPOSE 22

ENTRYPOINT ["/root/init.sh"]
