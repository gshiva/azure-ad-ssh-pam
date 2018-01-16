FROM ubuntu:16.04
ARG dirName
ARG clientID
RUN apt-get update && \
    apt-get install -y openssh-server rsyslog git && \
    service rsyslog start && \
    service ssh start
RUN git  clone https://github.com/gshiva/azure-ad-ssh-pam.git
COPY ./install.sh /azure-ad-ssh-pam/
RUN cd azure-ad-ssh-pam/ && ./install.sh ${dirName} ${clientID}
