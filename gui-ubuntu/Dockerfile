FROM ubuntu:latest

LABEL Description="Installing GUI on UBUNTU server"
MAINTAINER Auther="Saeed"

# This is the user/pass you can login with while connectiong by Remote Desktop
RUN useradd -m guiuser

RUN echo 'guiuser:123456' | chpasswd

ARG dest=/usr/app
RUN mkdir $dest
WORKDIR $dest


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        xfce4 \
        xrdp \
        tightvncserver \
        ufw \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN ufw allow 3389/tcp

RUN mkdir ~/.vnc
RUN echo "123456" | vncpasswd -f > ~/.vnc/passwd
RUN chmod 600 ~/.vnc/passwd

ENV USER=guiuser
ENV DISPLAY=:1

EXPOSE 5900 5901 3389
COPY ./services.sh $dest
RUN chmod +x ./services.sh

ENTRYPOINT ["./services.sh"]


