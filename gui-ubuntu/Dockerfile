FROM ubuntu:22.04

LABEL Description="Installing GUI on UBUNTU server"
MAINTAINER Auther="Saeed"

ARG dest=/usr/app
RUN mkdir $dest
WORKDIR $dest


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
	slim \
	ubuntu-mate-desktop \
	tightvncserver \
	xrdp \
	ufw 
#RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/*

RUN ufw allow 3389/tcp
#RUN systemctl start xrdp

RUN mkdir ~/.vnc
RUN echo "123456" | vncpasswd -f > ~/.vnc/passwd
RUN chmod 600 ~/.vnc/passwd

ENV USER=root
ENV DISPLAY=:1

EXPOSE 5900 5901 3389
#CMD ["sh", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && tail -F ~/.vnc/*.log"]
COPY ./services.sh $dest
RUN chmod +x ./services.sh

ENTRYPOINT ["./services.sh"]

