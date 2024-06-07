FROM debian:10

WORKDIR /home
ENV HOME /home
RUN cd ~
RUN apt-get update
RUN apt-get install -y git nano python3-pip python-dev pkg-config wget usbutils curl

RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" \
| tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update
RUN apt-get install -y edgetpu-examples

EXPOSE 5000
